<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$username = $_SESSION['username'];

$fecha_orden = $_POST['fecha_orden'];
$folio = $_POST['folio'];
$folio_cliente = $_POST['folio_cliente'];
/* $tecnico = $_POST['tecnico']; */
$fecha_corte = $_POST['fecha_corte'];

$query = "INSERT INTO cortes (
        folio_cliente,
        username,
        folio_corte,
        fecha,
        estatus
        ) VALUES (
        '$folio_cliente',
        '$username',
        '$folio',
        '$fecha_corte',
        1
        )";

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
        8,
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