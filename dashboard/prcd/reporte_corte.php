<?php
session_start();
require('pdf/fpdf/fpdf.php');
require('conn.php');

setlocale(LC_TIME, 'es_ES.UTF-8', 'spanish');
date_default_timezone_set('America/Mexico_City');

$fechaHoy = strftime("%Y-%m-%d");

$meses = [
    1 => 'enero', 2 => 'febrero', 3 => 'marzo', 
    4 => 'abril', 5 => 'mayo', 6 => 'junio',
    7 => 'julio', 8 => 'agosto', 9 => 'septiembre',
    10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
];

$user = $_SESSION['username'];
$row = $conn->query("SELECT * FROM users WHERE username = '$user'")->fetch_assoc();
$nombre = $row['nombre'];

class PDF extends FPDF {
    function Header() {
        $this->Image('../../images/logo_conectwi_wide-removebg-preview.png', ($this->GetPageWidth() - 100) / 2, 10, 100); // Logo centrado
        $this->SetY(40); // Espacio después del logo
        $this->SetFont('Arial', 'B', 14);
        $this->Cell(0, 10, 'REPORTE DE CORTE DE CAJA', 0, 1, 'C');
        $this->Ln(5);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo(), 0, 0, 'C');
    }

    // Función para crear tablas
    function Tabla($header, $data, $widths, $subtotal) {
        $this->SetFont('Arial', 'B', 10);
        // Cabecera
        foreach ($header as $i => $col) {
            $this->Cell($widths[$i], 7, utf8_decode($col), 1, 0, 'C');
        }
        $this->Ln();

        // Datos
        $this->SetFont('Arial', '', 10);
        foreach ($data as $row) {
            foreach ($row as $i => $col) {
                $this->Cell($widths[$i], 6, utf8_decode($col), 1, 0, 'C');
            }
            $this->Ln();
        }

        // Subtotales
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(array_sum($widths) - $widths[count($widths)-1], 6, 'SUBTOTAL', 1, 0, 'R');
        $this->Cell($widths[count($widths)-1], 6, '$' . number_format($subtotal, 2), 1, 1, 'C');
        $this->Ln(10); // Espacio entre tablas
    }
}

// Crear PDF
$pdf = new PDF();
$pdf->AddPage('P', 'A4');
$pdf->SetFont('Arial', '', 12);

// Tabla 1: Pagos Generales
$headerPagos = ['Folio Contrato', 'Folio Pago', 'Fecha', 'Periodo', 'Total'];
$dataPagos = [];
$totalPagos = 0;

$queryPagos = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user' AND fecha_pago = '$fechaHoy'");
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

$pdf->Tabla($headerPagos, $dataPagos, [40, 30, 30, 40, 30], $totalPagos);

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

$pdf->Tabla($headerGastos, $dataGastos, [80, 40, 40], $totalGastos);

// Tabla 3: Total Final
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(0, 10, 'TOTAL FINAL', 0, 1, 'C');
$pdf->Ln(2);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(100, 10, 'Ingresos (Pagos Generales):', 1, 0, 'R');
$pdf->Cell(30, 10, '$' . number_format($totalPagos, 2), 1, 1, 'C');

$pdf->Cell(100, 10, 'Egresos (Otros Gastos):', 1, 0, 'R');
$pdf->Cell(30, 10, '$' . number_format($totalGastos, 2), 1, 1, 'C');

$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(100, 10, 'TOTAL:', 1, 0, 'R');
$pdf->Cell(30, 10, '$' . number_format($totalPagos - $totalGastos, 2), 1, 1, 'C');

// Salida
$pdf->Output('I', 'reporte_corte_caja.pdf');
?>