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
    private $primaryColor = array(50, 100, 150);
    private $secondaryColor = array(220, 230, 240);
    
    public function getPrimaryColor() {
        return $this->primaryColor;
    }
    
    public function getSecondaryColor() {
        return $this->secondaryColor;
    }
    
    function Header() {
        if ($this->PageNo() == 1) {
            $this->Image('../../images/logo_conectwi_wide-removebg-preview.png', ($this->GetPageWidth() - 100) / 2, 8, 100);
            $this->SetY(35);
            
            $this->SetFont('Arial', 'B', 14);
            $primaryColor = $this->getPrimaryColor();
            $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
            $this->Cell(0, 8, utf8_decode('REPORTE DE CORTE DE CAJA'), 0, 1, 'C');
            
            $this->SetFont('Arial', '', 9);
            $this->SetTextColor(100, 100, 100);
            $this->Cell(0, 5, 'Generado el ' . date('d/m/Y'), 0, 1, 'C');
            $this->Ln(4);
        }
    }

    function Footer() {
        $this->SetY(-12);
        $this->SetFont('Arial', 'I', 7);
        $this->SetTextColor(100, 100, 100);
        $this->Cell(0, 4, utf8_decode('Sistema de Gestión ConectWi - Página ') . $this->PageNo(), 0, 0, 'C');
    }

    // FUNCIÓN CORREGIDA - TABLAS BIEN ALINEADAS
    function TablaEjecutiva($header, $data, $widths, $subtotal, $title) {
        // Título de la tabla - ALINEADO A LA IZQUIERDA
        $this->SetFont('Arial', 'B', 11);
        $primaryColor = $this->getPrimaryColor();
        $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->Cell(0, 6, utf8_decode($title), 0, 1, 'L');
        $this->Ln(2);
        
        $anchoTotal = array_sum($widths);
        $margen = 15; // 15mm desde el margen izquierdo
        $this->SetX($margen);
        
        // Cabecera con estilo
        $this->SetFillColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->SetTextColor(255);
        $this->SetFont('Arial', 'B', 9);
        
        foreach ($header as $i => $col) {
            $this->Cell($widths[$i], 6, utf8_decode($col), 1, 0, 'C', true);
        }
        $this->Ln();
        
        // Datos optimizados
        $this->SetFont('Arial', '', 8);
        $this->SetTextColor(50);
        
        foreach ($data as $row) {
            if ($this->GetY() > 240) {
                $this->AddPage();
            }
            
            $this->SetX($margen); // REESTABLECER MARGEN PARA CADA FILA
            foreach ($row as $i => $col) {
                if (strlen($col) > 25) {
                    $col = substr($col, 0, 22) . '...';
                }
                $this->Cell($widths[$i], 5, utf8_decode($col), 1, 0, 'C');
            }
            $this->Ln();
        }
        
        // Subtotales - ALINEADO AL MARGEN DE LA TABLA
        $this->SetX($margen);
        $this->SetFont('Arial', 'B', 9);
        $this->SetFillColor(230);
        $this->Cell($anchoTotal - $widths[count($widths)-1], 6, 'SUBTOTAL', 1, 0, 'R', true);
        $this->Cell($widths[count($widths)-1], 6, '$' . number_format($subtotal, 2), 1, 1, 'C', true);
        $this->Ln(6);
    }
}

// Crear PDF optimizado
$pdf = new PDF();
$pdf->SetMargins(15, 15, 15); // MÁRGENES UN POCO MÁS GRANDES
$pdf->AddPage('P', 'A4');
$pdf->SetAutoPageBreak(true, 20);
$pdf->Ln(5);
// Información del usuario compacta
$pdf->SetFont('Arial', 'B', 9);
$pdf->SetTextColor(80);
$pdf->Cell(0, 5, utf8_decode('Usuario: ') . utf8_decode($nombre), 0, 1);
$pdf->Cell(0, 5, utf8_decode('Fecha: ') . $fechaHoy, 0, 1);
$pdf->Ln(4);

// Tabla 1: Pagos Generales - ANCHOS CORREGIDOS
$headerPagos = ['Folio Contrato', 'Folio Pago', 'Fecha', 'Periodo', 'Total'];
$dataPagos = [];
$totalPagos = 0;

$queryPagos = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND DATE(fecha_pago) = '2025-08-18'");
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

// ANCHOS CORREGIDOS PARA QUE QUEPAN EN LA PÁGINA
$pdf->TablaEjecutiva($headerPagos, $dataPagos, [55, 30, 45, 20, 25], $totalPagos, 'PAGOS GENERALES');

// Tabla 2: Otros Gastos - ANCHOS CORREGIDOS
$headerGastos = ['Concepto', 'Fecha', 'Cantidad'];
$dataGastos = [];
$totalGastos = 0;

$queryGastos = $conn->query("SELECT * FROM otros_gastos WHERE id_ext = '$user' AND fecha = '$fechaHoy'");
while ($rowGastos = $queryGastos->fetch_assoc()) {
    $concepto = $rowGastos['concepto'];
    if (strlen($concepto) > 20) {
        $concepto = substr($concepto, 0, 17) . '...';
    }
    
    $dataGastos[] = [
        $concepto,
        $rowGastos['fecha'],
        '$' . number_format($rowGastos['cantidad'], 2)
    ];
    $totalGastos += $rowGastos['cantidad'];
}

// ANCHOS CORREGIDOS PARA QUE QUEPAN EN LA PÁGINA
$pdf->TablaEjecutiva($headerGastos, $dataGastos, [50, 25, 20], $totalGastos, 'OTROS GASTOS');

// Resumen Final - ALINEADO A LA IZQUIERDA
$primaryColor = $pdf->getPrimaryColor();
$secondaryColor = $pdf->getSecondaryColor();

$pdf->SetFont('Arial', 'B', 11);
$pdf->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
$pdf->Cell(0, 6, 'RESUMEN FINAL', 0, 1, 'L');
$pdf->Ln(2);

$pdf->SetFont('Arial', '', 9);
$pdf->SetFillColor($secondaryColor[0], $secondaryColor[1], $secondaryColor[2]);
$pdf->SetTextColor(50);

$pdf->Cell(80, 6, 'Ingresos:', 1, 0, 'R', true);
$pdf->Cell(30, 6, '$' . number_format($totalPagos, 2), 1, 1, 'C', true);

$pdf->Cell(80, 6, 'Egresos:', 1, 0, 'R', true);
$pdf->Cell(30, 6, '$' . number_format($totalGastos, 2), 1, 1, 'C', true);

$pdf->SetFont('Arial', 'B', 10);
$pdf->SetFillColor(230, 240, 255);
$pdf->Cell(80, 7, 'TOTAL:', 1, 0, 'R', true);
$pdf->Cell(30, 7, '$' . number_format($totalPagos - $totalGastos, 2), 1, 1, 'C', true);

// Firma compacta
if ($pdf->GetY() < 250) {
    $pdf->Ln(36);
    $pdf->SetX(($pdf->GetPageWidth() - 80) / 2);
    $pdf->Cell(80, 0, '', 'T');
    $pdf->Ln(3);
    $pdf->SetFont('Arial', 'I', 8);
    $pdf->Cell(0, 4, utf8_decode('Firma del responsable'), 0, 1, 'C');
    $pdf->Cell(0, 4, $nombre, 0, 1, 'C');
}

// Salida
$pdf->Output('I', 'reporte_corte_caja_' . $fechaHoy . '.pdf');
?>