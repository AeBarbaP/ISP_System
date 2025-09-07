<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
// $userLog = $_SESSION['username'];
$userLog = $_POST['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$nombre = $_POST['nombre'];
$pwd = $_POST['pass'];

$query = "UPDATE users SET 
        nombre = '$nombre',
        pwd = '$pwd',
        fecha_editar = '$fechaHoy'
        WHERE
        id = '$id'
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
        2,
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