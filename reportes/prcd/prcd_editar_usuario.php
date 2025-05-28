<?php

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$id = $_POST['id'];
$username = $_POST['username'];
$nombre = $_POST['nombre'];
$pwd = $_POST['pwd'];
$tipo_usr = $_POST['tipo_usr'];
$estatus = $_POST['estatus'];
$color = $_POST['colorUser'];

$query = "UPDATE users SET 
        username = '$username',
        nombre = '$nombre',
        pwd = '$pwd',
        tipo_usr = '$tipo_usr',
        estatus = '$estatus',
        color = '$color',
        fecha_editar = '$fechaHoy'
        WHERE
        id = '$id'
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