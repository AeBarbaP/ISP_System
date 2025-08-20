<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$comentario = $_POST['comentario'];

$query = "UPDATE cortes SET 
        comentario = '$comentario', 
        estatus =  1
        WHERE id = '$id'
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
        51,
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