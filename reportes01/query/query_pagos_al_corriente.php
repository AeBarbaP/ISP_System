<?php
require_once("../prcd/conn.php");
$x = 0;

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

$diaHoy = $hoy->format('d');
$mesHoy = $hoy->format('m');
$anioHoy = $hoy->format('Y');

$sql_clientes = "SELECT * FROM clientes";
$resultado_clientes = $conn->query($sql_clientes);

while ($cliente = $resultado_clientes->fetch_assoc()) {
    $fecha_corte = new DateTime($cliente['fecha_corte']);
    $fecha_corte->setTime(0, 0, 0); // Normalizar

    $folio = $cliente['folio'];
    $diaCorte = $fecha_corte->format('d');
    $mesCorte = $fecha_corte->format('m');
    $anioCorte = $fecha_corte->format('Y');

    // Evita sobreescribir el resultado de clientes
    $sqlPagos = "SELECT * FROM pagos_generales 
                 WHERE folio_contrato = '$folio' 
                 AND MONTH(fecha_pago) = '$mesCorte' 
                 AND YEAR(fecha_pago) = '$anioHoy'";

    $resultado_pagos = $conn->query($sqlPagos);
    $filas = $resultado_pagos->num_rows;

    if ($filas > 0) {
            $x++;
    }
}

echo json_encode(array(
    'success' => 1,
    'alDia' => $x
));
?>
