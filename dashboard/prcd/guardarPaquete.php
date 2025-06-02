<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$nombre = $_POST['nombre'];
$velocidad = $_POST['velocidad'];
$precio = $_POST['precio'];
$estatus = $_POST['estatus'];

$query = "INSERT INTO catalogo_paquetes (
        paquetes, 
        velocidad, 
        costo, 
        estatus
        ) VALUES (
        '$nombre', 
        '$velocidad', 
        '$precio', 
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
        9,
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