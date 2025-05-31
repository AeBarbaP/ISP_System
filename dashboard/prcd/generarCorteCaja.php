<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$estatus = 1;
$id = $_SESSION['idUsr'];

$query = "INSERT INTO corte_caja (
    usr,
    fecha,
    estatus
) VALUES (
    '$id',
    '$fechaHoy',
    '$estatus'
)
";

    $resultado = $conn->query($query);

    if($resultado){
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