<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$nombre = $_POST['nombre'];
$velocidad = $_POST['velocidad'];
$precio = $_POST['precio'];
$estatus = $_POST['estatus'];

$query = "UPDATE catalogo_paquetes SET 
        paquetes = '$nombre', 
        velocidad = '$velocidad', 
        costo = '$precio', 
        estatus = '$estatus'
        WHERE id = '$id'
";

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
        12,
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