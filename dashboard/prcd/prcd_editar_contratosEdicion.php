<?php
session_start();

require('conn.php');

// Log the action
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$folio = $_POST['folio'];
$nombre = $_POST['nombre'];
$domicilio = $_POST['domicilio'];
$comunidad = $_POST['comunidad'];
$municipio = $_POST['municipio'];
$estado = $_POST['estado'];
$cp = $_POST['cp'];
$telefono = $_POST['telefono'];
$referencia = $_POST['referencia'];
$identificacion = $_POST['identificacion'];
$comprobante = $_POST['comprobante'];
$paquete = $_POST['paquete'];
$antena = $_POST['antena'];
$ip = $_POST['ip'];
$fechaContrato = $_POST['fechaContrato'];
$fechaLimite = $_POST['fechaLimite'];
$fechaCorte = $_POST['fechaCorte'];
$cuota = $_POST['cuota'];

$query = "UPDATE clientes SET 
    nombre = '$nombre', 
    domicilio = '$domicilio',
    comunidad = '$comunidad', 
    municipio = '$municipio',
    estado = '$estado',
    cp = '$cp',
    telefono = '$telefono',
    referencias = '$referencia',
    identificacion = '$identificacion',
    comprobante = '$comprobante',
    servicio = '$paquete',
    antena = '$antena',
    direccionip = '$ip',
    fecha_contrato = '$fechaContrato',
    fecha_limite = '$fechaLimite',
    fecha_corte = '$fechaCorte',
    cuota = '$cuota'
WHERE folio = '$folio'";

$resultado = $conn->query($query);

if ($resultado) {

    $sqlAntena = "UPDATE antenas SET
        estatus = 0
        WHERE
        id = '$antena'
        ";
        $resultadoAntena = $conn->query($sqlAntena);

    echo json_encode(array(
        'success' => 1
    ));

    $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        33,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);

} else {
    $error = $conn->error;
    echo json_encode(array(
        'success' => 0,
        'error' => $error
    ));
}

?>