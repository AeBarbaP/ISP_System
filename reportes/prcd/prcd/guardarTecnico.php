<?php

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$fecha = $_POST['fecha'];
$nombre = $_POST['nombre'];
$estatus_tecnico = $_POST['estatus_tecnico'];

$query = "INSERT INTO tecnicos (
        nombre, 
        estatus, 
        fecha_creacion
        ) VALUES (
        '$nombre', 
        '$estatus_tecnico', 
        '$fechaHoy'
        
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