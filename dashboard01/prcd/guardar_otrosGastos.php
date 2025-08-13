<?php

session_start();
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

require('conn.php');

$concepto = $_POST['concepto'];
$cantidad = $_POST['cantidad'];
$fecha = $_POST['fecha'];
$idUsuario = $_POST['idUsuario'];

$sql = "INSERT INTO otros_gastos(
    concepto,
    cantidad,
    fecha,
    id_ext,
    fecha_sistema
) VALUES (
    '$concepto',
    '$cantidad',
    '$fecha',
    '$idUsuario',
    '$fechaHoy'
)";
$resultado = $conn->query($sql);
if ($resultado) {
    echo json_encode(array(
        'success' => 1
    ));
} else {
    echo json_encode(array(
        'success' => 0,
        'error' => $conn->error
    ));
}