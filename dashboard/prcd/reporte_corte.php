<?php
session_start();
require('pdf/fpdf/fpdf.php');
require('conn.php');

setlocale(LC_TIME, 'es_ES.UTF-8', 'spanish');
date_default_timezone_set('America/Mexico_City');

$fechaHoy = (new DateTime())->format('Y-m-d');
$fechaFormateada = strftime("%d de %B de %Y");

$user = $_SESSION['username'];
$row = $conn->query("SELECT * FROM users WHERE username = '$user'")->fetch_assoc();
$nombre = $row['nombre'];

class PDF extends FPDF {
    private $primaryColor = array(50, 100, 150); // Azul corporativo
    private $secondaryColor = array(220, 230, 240); // Fondo claro
    
    // Métodos públicos para acceder a los colores
    public function getPrimaryColor() {
        return $this->primaryColor;
    }
    
    public function getSecondaryColor() {
        return $this->secondaryColor;
    }
    
    function Header() {
        $fechaHoy = (new DateTime())->format('Y-m-d');
        // Logo centrado con margen superior
        $this->Image('../../images/logo_conectwi_wide-removebg-preview.png', ($this->GetPageWidth() - 120) / 2, 12, 120);
        $this->SetY(40); // Espacio después del logo
        
        // Título principal
        $this->SetFont('Arial', 'B', 16);
        $primaryColor = $this->getPrimaryColor();
        $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->Cell(0, 10, utf8_decode('REPORTE DE CORTE DE CAJA'), 0, 1, 'C');
        
        // Subtítulo con fecha
        $this->SetFont('Arial', '', 10);
        $this->SetTextColor(100, 100, 100);
        $this->Cell(0, 6, 'Generado el ' . $fechaHoy, 0, 1, 'C');
        $this->Ln(8);
    }

    function Footer() {
        $this->SetY(-18);
        $this->SetFont('Arial', 'I', 8);
        $this->SetTextColor(100, 100, 100);
        $this->Cell(0, 6, utf8_decode('Sistema de Gestión ConectWi'), 0, 1, 'C');
        $this->Cell(0, 6, utf8_decode('Página ') . $this->PageNo() . ' de {nb}', 0, 0, 'C');
    }

    // Función mejorada para crear tablas
    function TablaEjecutiva($header, $data, $widths, $subtotal, $title) {
        $anchoTotal = array_sum($widths);
        $margen = ($this->GetPageWidth() - $anchoTotal) / 2;
        $this->SetX($margen); // Centrar tabla
        
        // Título de la tabla
        $this->SetFont('Arial', 'B', 12);
        $primaryColor = $this->getPrimaryColor();
        $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->Cell($anchoTotal, 8, utf8_decode($title), 0, 1, 'L');
        $this->Ln(2);
        
        // Cabecera con estilo
        $this->SetFillColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->SetTextColor(255);
        $this->SetFont('Arial', 'B', 10);
        
        foreach ($header as $i => $col) {
            $this->Cell($widths[$i], 8, utf8_decode($col), 1, 0, 'C', true);
        }
        $this->Ln();
        
        // Datos con ajuste de texto
        $this->SetFont('Arial', '', 9);
        $this->SetTextColor(50);
        $fill = false;
        
        foreach ($data as $row) {
            // Determinar altura necesaria para la fila
            $nb = 0;
            for ($i = 0; $i < count($row); $i++) {
                $nb = max($nb, $this->NbLines($widths[$i], utf8_decode($row[$i])));
            }
            $h = 6 * $nb;
            
            // Dibujar celdas
            for ($i = 0; $i < count($row); $i++) {
                $x = $this->GetX();
                $y = $this->GetY();
                
                if ($fill) {
                    $secondaryColor = $this->getSecondaryColor();
                    $this->SetFillColor($secondaryColor[0], $secondaryColor[1], $secondaryColor[2]);
                } else {
                    $this->SetFillColor(255);
                }
                
                $this->Rect($x, $y, $widths[$i], $h, 'F');
                $this->MultiCell($widths[$i], 6, utf8_decode($row[$i]), 1, 'C');
                $this->SetXY($x + $widths[$i], $y);
            }
            $this->Ln($h);
            $fill = !$fill;
        }
        
        // Subtotales con estilo
        $this->SetFont('Arial', 'B', 10);
        $this->SetFillColor(230);
        $this->Cell($anchoTotal - $widths[count($widths)-1], 8, 'SUBTOTAL', 1, 0, 'R', true);
        $this->Cell($widths[count($widths)-1], 8, '$' . number_format($subtotal, 2), 1, 1, 'C', true);
        $this->Ln(12);
    }
    
    // Función para calcular líneas necesarias
    function NbLines($w, $txt) {
        $cw = &$this->CurrentFont['cw'];
        if ($w == 0) {
            $w = $this->w - $this->rMargin - $this->x;
        }
        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
        $s = str_replace("\r", '', $txt);
        $nb = strlen($s);
        if ($nb > 0 && $s[$nb-1] == "\n") {
            $nb--;
        }
        $sep = -1;
        $i = 0;
        $j = 0;
        $l = 0;
        $nl = 1;
        while ($i < $nb) {
            $c = $s[$i];
            if ($c == "\n") {
                $i++;
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
                continue;
            }
            if ($c == ' ') {
                $sep = $i;
            }
            $l += $cw[$c];
            if ($l > $wmax) {
                if ($sep == -1) {
                    if ($i == $j) {
                        $i++;
                    }
                } else {
                    $i = $sep + 1;
                }
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
            } else {
                $i++;
            }
        }
        return $nl;
    }
}

// Crear PDF
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage('P', 'A4');
$pdf->SetAutoPageBreak(true, 25);

// Información del usuario
$pdf->SetFont('Arial', '', 10);
$pdf->SetTextColor(80);
$pdf->Cell(0, 6, utf8_decode('Usuario: ') . utf8_decode($nombre), 0, 1);
$pdf->Cell(0, 6, utf8_decode('Fecha del corte: ') . utf8_decode($fechaHoy), 0, 1);
$pdf->Ln(8);

// Tabla 1: Pagos Generales
$headerPagos = ['Folio Contrato', 'Folio Pago', 'Fecha', 'Periodo', 'Total'];
$dataPagos = [];
$totalPagos = 0;

$queryPagos = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND DATE(fecha_pago) = '$fechaHoy'");
while ($rowPagos = $queryPagos->fetch_assoc()) {
    $dataPagos[] = [
        $rowPagos['folio_contrato'],
        $rowPagos['folio_pago'],
        $rowPagos['fecha_pago'],
        $rowPagos['periodo'],
        '$' . number_format($rowPagos['total'], 2)
    ];
    $totalPagos += $rowPagos['total'];
}

// Anchos de columnas ajustados al 90% del ancho de página (190mm)
$pdf->TablaEjecutiva($headerPagos, $dataPagos, [50, 35, 30, 40, 35], $totalPagos, 'PAGOS GENERALES');

// Tabla 2: Otros Gastos
$headerGastos = ['Concepto', 'Fecha', 'Cantidad'];
$dataGastos = [];
$totalGastos = 0;

$queryGastos = $conn->query("SELECT * FROM otros_gastos WHERE id_ext = '$user' AND fecha = '$fechaHoy'");
while ($rowGastos = $queryGastos->fetch_assoc()) {
    $dataGastos[] = [
        $rowGastos['concepto'],
        $rowGastos['fecha'],
        '$' . number_format($rowGastos['cantidad'], 2)
    ];
    $totalGastos += $rowGastos['cantidad'];
}

$pdf->TablaEjecutiva($headerGastos, $dataGastos, [110, 30, 50], $totalGastos, 'OTROS GASTOS');

// Resumen Final
$primaryColor = $pdf->getPrimaryColor();
$secondaryColor = $pdf->getSecondaryColor();

$pdf->SetX(($pdf->GetPageWidth() - 130) / 2);
$pdf->SetFont('Arial', 'B', 12);
$pdf->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
$pdf->Cell(130, 8, 'RESUMEN FINAL', 0, 1, 'C');
$pdf->Ln(2);

// Estilo para el resumen
$pdf->SetFont('Arial', '', 11);
$pdf->SetFillColor($secondaryColor[0], $secondaryColor[1], $secondaryColor[2]);
$pdf->SetTextColor(50);

// Ingresos
$pdf->Cell(90, 10, 'Ingresos (Pagos Generales):', 1, 0, 'R', true);
$pdf->Cell(40, 10, '$' . number_format($totalPagos, 2), 1, 1, 'C', true);

// Egresos
$pdf->Cell(90, 10, 'Egresos (Otros Gastos):', 1, 0, 'R', true);
$pdf->Cell(40, 10, '$' . number_format($totalGastos, 2), 1, 1, 'C', true);

// Total
$pdf->SetFont('Arial', 'B', 12);
$pdf->SetFillColor(230, 240, 255);
$pdf->Cell(90, 12, 'TOTAL:', 1, 0, 'R', true);
$pdf->Cell(40, 12, '$' . number_format($totalPagos - $totalGastos, 2), 1, 1, 'C', true);

// Firma
$pdf->Ln(15);
$pdf->SetX(($pdf->GetPageWidth() - 100) / 2);
$pdf->Cell(100, 0, '', 'T');
$pdf->Ln(5);
$pdf->SetFont('Arial', 'I', 10);
$pdf->Cell(190, 6, utf8_decode('Firma del responsable'), 0, 1, 'C');
$pdf->Cell(190, 6, $nombre, 0, 1, 'C');

// Salida
$pdf->Output('I', 'reporte_corte_caja_' . $fechaHoy . '.pdf');
?>