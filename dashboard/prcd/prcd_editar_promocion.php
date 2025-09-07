<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
// $userLog = $_SESSION['username'];
$userLog = $_POST['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$fecha_inicio = $_POST['fecha_inicio'];
$fecha_fin = $_POST['fecha_fin'];
$nombre = $_POST['nombre_promocion'];
$tipo = $_POST['tipo_promocion'];
$descuento = $_POST['descuento_promo'];

$query = "UPDATE promociones SET 
    promo = '$nombre',
    tipo = '$tipo',
    descuento = '$descuento',
    fecha_inicio = '$fecha_inicio',
    fecha_fin = '$fecha_fin'
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
        13,
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