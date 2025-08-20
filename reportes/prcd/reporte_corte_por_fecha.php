<?php
session_start();
require('pdf/fpdf/fpdf.php');
require('conn.php');

setlocale(LC_TIME, 'es_ES.UTF-8', 'spanish');
date_default_timezone_set('America/Mexico_City');

$fecha = $_REQUEST['fecha'];
$fechaHoy = (new DateTime($fecha))->format('Y-m-d');
$fechaFormateada = (new DateTime($fecha))->format('d/m/Y');

$user = $_REQUEST['username'];
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
        // Solo mostrar encabezado en la primera página
        if ($this->PageNo() == 1) {
            $this->Image('../../images/logo_conectwi_wide-removebg-preview.png', ($this->GetPageWidth() - 120) / 2, 12, 120);
            $this->SetY(45);
            
            $this->SetFont('Arial', 'B', 16);
            $primaryColor = $this->getPrimaryColor();
            $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
            $this->Cell(0, 10, utf8_decode('REPORTE DE CORTE DE CAJA'), 0, 1, 'C');
            
            $this->SetFont('Arial', '', 10);
            $this->SetTextColor(100, 100, 100);
            $this->Cell(0, 6, 'Generado el ' . date('d/m/Y'), 0, 1, 'C');
            $this->Ln(8);
        }
    }

    function Footer() {
        // Solo mostrar pie de página si hay contenido
        if ($this->GetY() > 250) return;
        
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->SetTextColor(100, 100, 100);
        $this->Cell(0, 6, utf8_decode('Página ') . $this->PageNo(), 0, 0, 'C');
    }

    function TablaEjecutiva($header, $data, $widths, $subtotal, $title) {
        $anchoTotal = array_sum($widths);
        $margen = ($this->GetPageWidth() - $anchoTotal) / 2;
        $this->SetX($margen);
        
        // Verificar espacio disponible antes de dibujar
        $alturaNecesaria = 30 + (count($data) * 12);
        if ($this->GetY() + $alturaNecesaria > 250) {
            $this->AddPage();
        }
        
        $this->SetFont('Arial', 'B', 12);
        $primaryColor = $this->getPrimaryColor();
        $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->Cell($anchoTotal, 8, utf8_decode($title), 0, 1, 'L');
        $this->Ln(2);
        
        // Cabecera
        $this->SetFillColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->SetTextColor(255);
        $this->SetFont('Arial', 'B', 10);
        
        foreach ($header as $i => $col) {
            $this->Cell($widths[$i], 8, utf8_decode($col), 1, 0, 'C', true);
        }
        $this->Ln();
        
        // Datos (versión simplificada sin MultiCell para evitar saltos)
        $this->SetFont('Arial', '', 9);
        $this->SetTextColor(50);
        
        foreach ($data as $row) {
            // Verificar si necesita nueva página
            if ($this->GetY() > 250) {
                $this->AddPage();
            }
            
            foreach ($row as $i => $col) {
                // Acortar texto muy largo
                if (strlen($col) > 30) {
                    $col = substr($col, 0, 27) . '...';
                }
                $this->Cell($widths[$i], 5, utf8_decode($col), 1, 0, 'C');
            }
            $this->Ln();
        }
        
        // Subtotales
        $this->SetFont('Arial', 'B', 10);
        $this->SetFillColor(230);
        $this->Cell($anchoTotal - $widths[count($widths)-1], 8, 'SUBTOTAL', 1, 0, 'R', true);
        $this->Cell($widths[count($widths)-1], 8, '$' . number_format($subtotal, 2), 1, 1, 'C', true);
        $this->Ln(8);
    }
}

// Crear PDF con márgenes optimizados
$pdf = new PDF();
$pdf->SetMargins(15, 15, 15); // Márgenes reducidos
$pdf->AddPage('P', 'A4');
$pdf->SetAutoPageBreak(true, 15); // Margen inferior reducido a 15mm

// Información del usuario
$pdf->SetFont('Arial', '', 10);
$pdf->SetTextColor(80);
$pdf->Cell(0, 6, utf8_decode('Usuario: ') . utf8_decode($nombre), 0, 1);
$pdf->Cell(0, 6, utf8_decode('Fecha del corte: ') . $fechaFormateada, 0, 1);
$pdf->Ln(5);

// Tabla 1: Pagos Generales
$headerPagos = ['Cliente', 'Folio Pago', 'Fecha', 'Periodo', 'Total'];
$dataPagos = [];
$totalPagos = 0;

$queryPagos = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND DATE(fecha_pago) = '$fechaHoy'");
while ($rowPagos = $queryPagos->fetch_assoc()) {
    $folioContrato = $rowPagos['folio_contrato'];
    $row2 = $conn->query("SELECT * FROM clientes WHERE folio = '$folioContrato'")->fetch_assoc();
    $nombreCliente = $row2['nombre'] ?? 'N/A';
    
    // Acortar nombre muy largo
    if (strlen($nombreCliente) > 25) {
        $nombreCliente = substr($nombreCliente, 0, 22) . '...';
    }
    
    $dataPagos[] = [
        $nombreCliente,
        $rowPagos['folio_pago'],
        $rowPagos['fecha_pago'],
        $rowPagos['periodo'],
        '$' . number_format($rowPagos['total'], 2)
    ];
    $totalPagos += $rowPagos['total'];
}

$pdf->TablaEjecutiva($headerPagos, $dataPagos, [70, 35, 35, 20, 23], $totalPagos, 'PAGOS GENERALES');

// Tabla 2: Otros Gastos
$headerGastos = ['Concepto', 'Fecha', 'Cantidad'];
$dataGastos = [];
$totalGastos = 0;

$queryGastos = $conn->query("SELECT * FROM otros_gastos WHERE id_ext = '$user' AND fecha = '$fechaHoy'");
while ($rowGastos = $queryGastos->fetch_assoc()) {
    $concepto = $rowGastos['concepto'];
    // Acortar concepto muy largo
    if (strlen($concepto) > 25) {
        $concepto = substr($concepto, 0, 22) . '...';
    }
    
    $dataGastos[] = [
        $concepto,
        $rowGastos['fecha'],
        '$' . number_format($rowGastos['cantidad'], 2)
    ];
    $totalGastos += $rowGastos['cantidad'];
}

$pdf->TablaEjecutiva($headerGastos, $dataGastos, [70, 30, 30], $totalGastos, 'OTROS GASTOS');

// Resumen Final (solo si hay espacio)
if ($pdf->GetY() > 200) {
    $pdf->AddPage();
}

$primaryColor = $pdf->getPrimaryColor();
$secondaryColor = $pdf->getSecondaryColor();

$pdf->SetX(($pdf->GetPageWidth() - 130) / 2);
$pdf->SetFont('Arial', 'B', 12);
$pdf->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
$pdf->Cell(130, 8, 'RESUMEN FINAL', 0, 1, 'C');
$pdf->Ln(2);

$pdf->SetFont('Arial', '', 11);
$pdf->SetFillColor($secondaryColor[0], $secondaryColor[1], $secondaryColor[2]);
$pdf->SetTextColor(50);

$pdf->Cell(90, 10, 'Ingresos (Pagos Generales):', 1, 0, 'R', true);
$pdf->Cell(40, 10, '$' . number_format($totalPagos, 2), 1, 1, 'C', true);

$pdf->Cell(90, 10, 'Egresos (Otros Gastos):', 1, 0, 'R', true);
$pdf->Cell(40, 10, '$' . number_format($totalGastos, 2), 1, 1, 'C', true);

$pdf->SetFont('Arial', 'B', 12);
$pdf->SetFillColor(230, 240, 255);
$pdf->Cell(90, 12, 'TOTAL:', 1, 0, 'R', true);
$pdf->Cell(40, 12, '$' . number_format($totalPagos - $totalGastos, 2), 1, 1, 'C', true);

// Firma (solo si hay espacio)
if ($pdf->GetY() < 230) {
    $pdf->Ln(15);
    $pdf->SetX(($pdf->GetPageWidth() - 100) / 2);
    $pdf->Cell(100, 0, '', 'T');
    $pdf->Ln(5);
    $pdf->SetFont('Arial', 'I', 10);
    $pdf->Cell(0, 6, utf8_decode('Firma del responsable'), 0, 1, 'C');
    $pdf->Cell(0, 6, $nombre, 0, 1, 'C');
}

// Salida
$pdf->Output('I', 'reporte_corte_caja_' . $fechaHoy . '.pdf');
?>