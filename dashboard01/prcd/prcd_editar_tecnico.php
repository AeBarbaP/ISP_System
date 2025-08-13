<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$fecha = $_POST['fecha'];
$nombre = $_POST['nombre'];
$estatus = $_POST['estatus'];

$query = "UPDATE tecnicos SET 
        estatus = '$estatus',
        fecha_actualizacion = '$fecha',
        nombre = '$nombre',
        estatus = '$estatus'
        WHERE
        id = '$id'
";

    $resultado = $conn->query($query);

    if($resultado){
        // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        14,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
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