<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$fecha_inicio = $_POST['fecha_inicio'];
$fecha_fin = $_POST['fecha_fin'];
$nombre_promocion = $_POST['nombre_promocion'];
$tipo_promocion = $_POST['tipo_promocion'];
$descuento_promo = $_POST['descuento_promo'];
$estatus = 1;

$query = "INSERT INTO promociones (
        fecha_inicio,
        fecha_fin,
        promo,
        tipo,
        descuento,
        estatus
        ) VALUES (
        '$fecha_inicio',
        '$fecha_fin',
        '$nombre_promocion',
        '$tipo_promocion',
        '$descuento_promo',
        '$estatus'
        )";
        $resultado = $conn->query($query);
        if($resultado){
            echo json_encode(array(
                'success'=>1
            ));
            // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        41,
        $fechaHoy,
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
        }
        else{
            $error = $conn->error;
            echo json_encode(array(
                'success'=>0,
                'error' => $error
            ));
        }
?>