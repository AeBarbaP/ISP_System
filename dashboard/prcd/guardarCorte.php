<?php

require('conn.php');


$fecha_orden = $_POST['fecha_orden'];
$username = $_POST['username'];
$folio = $_POST['folio'];
$tecnico = $_POST['tecnico'];
$fecha_asignacion = $_POST['fecha_asignacion'];

$query = "INSERT INTO cortes (
        folio,
        username,
        folio_corte,
        fecha,
        tecnico
        ) VALUES (
        '$fecha_orden',
        '$username',
        '$folio',
        '$tecnico',
        '$fecha_asignacion'
        )";

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