<?php

require('conn.php');

$id = $_POST['id'];
$fecha_alta = $_POST['fecha_alta'];
$marca = $_POST['marca'];
$modelo = $_POST['modelo'];
$serie = $_POST['serie'];
$mac = $_POST['mac'];

$query = "UPDATE antenas SET 
        marca = '$marca', 
        modelo = '$modelo', 
        num_serie = '$serie', 
        mac = '$mac'
        WHERE id = '$id'
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