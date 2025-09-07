<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

// $usr = $_SESSION['username'];
$usr = $_POST['username'];

$concepto = $_POST['concepto'];
$cantidad = $_POST['cantidad'];
$fecha = $_POST['fecha'];
$id = $_POST['id'];

$sql = "UPDATE otros_gastos SET
    concepto = '$concepto',
    cantidad = '$cantidad',
    fecha = '$fecha',
    id_ext = '$usr',
    fecha = '$fechaHoy'
WHERE id = '$id'
";

$resultado = $conn->query($sql);
if ($resultado) {
    $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$usr',
        48,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
    echo json_encode(array(
        'success' => 1
    ));
} else {
    echo json_encode(array(
        'success' => 0,
        'error' => $conn->error
    ));
}