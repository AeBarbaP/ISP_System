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
        if ($this->PageNo() == 1) {
            // Logo más compacto
            $this->Image('../../images/logo_conectwi_wide-removebg-preview.png', ($this->GetPageWidth() - 100) / 2, 8, 100);
            $this->SetY(32); // POSICIÓN MÁS ALTA
            $this->Ln(5);
            $this->SetFont('Arial', 'B', 14);
            $primaryColor = $this->getPrimaryColor();
            $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
            $this->Cell(0, 6, utf8_decode('REPORTE DE CORTE DE CAJA'), 0, 1, 'C');
            
            $this->SetFont('Arial', '', 8);
            $this->SetTextColor(100, 100, 100);
            $this->Cell(0, 4, 'Generado el ' . date('d/m/Y'), 0, 1, 'C');
            // ELIMINADO: $this->Ln(8);
        }
    }

    function Footer() {
        if ($this->GetY() > 250) return;
        
        $this->SetY(-10); // MÁS CERCA DEL BORDE
        $this->SetFont('Arial', 'I', 7);
        $this->SetTextColor(100, 100, 100);
        $this->Cell(0, 3, utf8_decode('Página ') . $this->PageNo(), 0, 0, 'C');
    }

    function TablaEjecutiva($header, $data, $widths, $subtotal, $title) {
        $anchoTotal = array_sum($widths);
        $margen = ($this->GetPageWidth() - $anchoTotal) / 2;
        $this->SetX($margen);
        
        // Título de la tabla (más compacto)
        $this->SetFont('Arial', 'B', 10);
        $primaryColor = $this->getPrimaryColor();
        $this->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->Cell($anchoTotal, 5, utf8_decode($title), 0, 1, 'L');
        // ELIMINADO: $this->Ln(2);
        
        // Cabecera
        $this->SetFillColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
        $this->SetTextColor(255);
        $this->SetFont('Arial', 'B', 8);
        
        foreach ($header as $i => $col) {
            $this->Cell($widths[$i], 5, utf8_decode($col), 1, 0, 'C', true);
        }
        $this->Ln();
        
        // Datos
        $this->SetFont('Arial', '', 7);
        $this->SetTextColor(50);
        
        foreach ($data as $row) {
            if ($this->GetY() > 250) {
                $this->AddPage();
            }
            
            foreach ($row as $i => $col) {
                if (strlen($col) > 25) {
                    $col = substr($col, 0, 22) . '...';
                }
                $this->Cell($widths[$i], 4, utf8_decode($col), 1, 0, 'C');
            }
            $this->Ln();
        }
        
        // Subtotales
        $this->SetFont('Arial', 'B', 8);
        $this->SetFillColor(230);
        $this->Cell($anchoTotal - $widths[count($widths)-1], 5, 'SUBTOTAL', 1, 0, 'L', true);
        $this->Cell($widths[count($widths)-1], 5, '$' . number_format($subtotal, 2), 1, 1, 'C', true);
        $this->Ln(3); // REDUCIDO de 12 a 3
    }
}

// Crear PDF SUPER compacto
$pdf = new PDF();
$pdf->SetMargins(20, 8, 8); // Márgenes mínimos
$pdf->AddPage('P', 'A4');
$pdf->SetAutoPageBreak(true, 8); // Margen inferior mínimo
$pdf->Ln(5);
// Información del usuario (COMPACTA)
$pdf->SetFont('Arial', 'B', 9);
$pdf->SetTextColor(80);
$pdf->Cell(0, 4, utf8_decode('Usuario: ') . utf8_decode($nombre), 0, 1);
$pdf->Cell(0, 4, utf8_decode('Fecha: ') . $fechaFormateada, 0, 1);
// ELIMINADO: $pdf->Ln(5);
$pdf->Ln(5);

// Tabla 1: Pagos Generales
$headerPagos = ['Cliente', 'Folio', 'Fecha', 'Periodo', 'Total'];
$dataPagos = [];
$totalPagos = 0;

$queryPagos = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND DATE(fecha_pago) = '$fechaHoy' AND tipo_pago = 1");
while ($rowPagos = $queryPagos->fetch_assoc()) {
    $folioContrato = $rowPagos['folio_contrato'];
    $row2 = $conn->query("SELECT * FROM clientes WHERE folio = '$folioContrato'")->fetch_assoc();
    $nombreCliente = $row2['nombre'] ?? 'N/A';
    
    if (strlen($nombreCliente) > 1000) {
        $nombreCliente = substr($nombreCliente, 0, 17) . '...';
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

$pdf->TablaEjecutiva($headerPagos, $dataPagos, [72, 30, 35, 15, 20], $totalPagos, 'PAGOS EN EFECTIVO');

// Tabla 2: Pagos Generales en Transferencia o Tarjeta
    $headerPagos2 = ['Cliente', 'Folio', 'Fecha', 'Periodo', 'Total'];
    $dataPagos2 = [];
    $totalPagosT = 0;

    $queryPagos2 = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND DATE(fecha_pago) = '$fechaHoy' AND tipo_pago IN (2,3,4)");
    while ($rowPagos2 = $queryPagos2->fetch_assoc()) {
        $folioContrato2 = $rowPagos2['folio_contrato'];
        $row3 = $conn->query("SELECT * FROM clientes WHERE folio = '$folioContrato2'")->fetch_assoc();
        $nombreCliente2 = $row3['nombre'] ?? 'N/A';
        
        if (strlen($nombreCliente) > 1000) {
            $nombreCliente2 = substr($nombreCliente2, 0, 17) . '...';
        }
        
        $dataPagos2[] = [
            $nombreCliente2,
            $rowPagos2['folio_pago'],
            $rowPagos2['fecha_pago'],
            $rowPagos2['periodo'],
            '$' . number_format($rowPagos2['total'], 2)
        ];
        $totalPagosT += $rowPagos2['total'];
    }

    $pdf->TablaEjecutiva($headerPagos2, $dataPagos2, [72, 30, 35, 15, 20], $totalPagosT, 'PAGOS POR TRANSFERENCIA/TARJETA');

// Tabla 3: Otros Gastos
$headerGastos = ['Concepto', 'Fecha', 'Monto'];
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

$pdf->TablaEjecutiva($headerGastos, $dataGastos, [50, 25, 20], $totalGastos, 'OTROS GASTOS');

// Resumen Final (COMPACTO)
$primaryColor = $pdf->getPrimaryColor();
$secondaryColor = $pdf->getSecondaryColor();

// $pdf->SetX(($pdf->GetPageWidth() - 100) / 2);
$pdf->SetFont('Arial', 'B', 9);
$pdf->SetTextColor($primaryColor[0], $primaryColor[1], $primaryColor[2]);
$pdf->Cell(100, 5, 'RESUMEN FINAL', 0, 1, 'L');
// ELIMINADO: $pdf->Ln(2);

$pdf->SetFont('Arial', '', 8);
$pdf->SetFillColor($secondaryColor[0], $secondaryColor[1], $secondaryColor[2]);
$pdf->SetTextColor(50);

$pdf->Cell(70, 5, 'Ingresos en Efectivo:', 1, 0, 'R', true);
$pdf->Cell(20, 5, '$' . number_format($totalPagos, 2), 1, 1, 'R', true);

$pdf->Cell(70, 5, 'Ingresos por Transferencia/Tarjeta:', 1, 0, 'R', true);
$pdf->Cell(20, 5, '$' . number_format($totalPagosT, 2), 1, 1, 'R', true);

$pdf->Cell(70, 5, 'Egresos:', 1, 0, 'R', true);
$pdf->Cell(20, 5, '$' . number_format($totalGastos, 2), 1, 1, 'R', true);

$pdf->SetFont('Arial', 'B', 9);
$pdf->SetFillColor(230, 240, 255);
$pdf->Cell(70, 6, 'TOTAL:', 1, 0, 'R', true);
$pdf->Cell(20, 6, '$' . number_format(($totalPagos + $totalPagosT) - $totalGastos, 2), 1, 1, 'R', true);

// Firma (COMPACTA)
if ($pdf->GetY() < 260) {
    $pdf->Ln(18);
    $pdf->SetX(($pdf->GetPageWidth() - 60) / 2);
    $pdf->Cell(60, 0, '', 'T');
    $pdf->Ln(2);
    $pdf->SetFont('Arial', 'I', 7);
    $pdf->Cell(0, 3, utf8_decode('Firma del responsable'), 0, 1, 'C');
    $pdf->Cell(0, 3, $nombre, 0, 1, 'C');
}

// Salida
$pdf->Output('I', 'reporte_corte_caja_' . $fechaHoy . '.pdf');
?>