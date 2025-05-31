<?php

require('conn.php');

$id = $_POST['id'];
$municipio = $_POST['municipio'];
$estado = $_POST['estado'];

$query = "UPDATE catalogo_municipio SET 
        municipio = '$municipio', 
        estado = '$estado'
        WHERE id = '$id'";

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