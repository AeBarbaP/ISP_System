<?php

require('conn.php');

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
    }
    else{
        $error = $conn->error;
        echo json_encode(array(
            'success'=>0,
            'error' => $error
        ));
    }

?>