<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$municipio = $_POST['municipio'];
$estado = $_POST['estado'];
$comunidad = $_POST['comunidad'];

$query = "UPDATE catalogo_comunidades SET 
        municipio = '$municipio', 
        estado = '$estado',
        comunidad = '$comunidad'
        WHERE id = '$id'";

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
        42,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log --------------- ojo modificar el 33 porque ese es para municipios
    }
    else{
        $error = $conn->error;
        echo json_encode(array(
            'success'=>0,
            'error' => $error
        ));
    }

?>