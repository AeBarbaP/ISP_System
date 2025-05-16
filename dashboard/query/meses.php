<?php
require('../prcd/conn.php');

$inicio = new DateTime('2024-01-01');
$fin = new DateTime('2025-05-01');

$folioContrato = '202502242354403E354EA1';

while ($inicio <= $fin) {
    $mes = $inicio->format('m');
    $anio = $inicio->format('Y');

    // Consulta por mes y año en MySQL
    $sql = "SELECT * FROM pagos 
            WHERE folio_contrato = '$folioContrato' 
            AND MONTH(fecha_pago) = '$mes' 
            AND YEAR(fecha_pago) = '$anio'";

    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();

    if ($row) {
        echo "Ya existe un pago para el mes: " . $inicio->format('Y-m') . "<br>";
    } else {
        echo "No existe un pago para el mes: " . $inicio->format('Y-m') . "<br>";
    }

    $inicio->modify('+1 month');
}
?>
