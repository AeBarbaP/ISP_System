<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");
$userLog = $_SESSION['username'];

$username = $_SESSION['username'];
$folio = $_POST['folio'];
$fecha_corte = $_POST['fecha_corte'];

$query = "UPDATE cortes SET
    username = '$username',
    fecha = '$fecha_corte'
    WHERE folio_corte = '$folio'
";

$resultado = $conn->query($query);

if($resultado){
    $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        3,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    $error = $conn->error;
    echo json_encode(array(
        'success'=>0,
        'error' => $error
    ));
}

?>