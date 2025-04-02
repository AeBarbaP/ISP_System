<?php

require('conn.php');

$nombre = $_POST['nombre'];
$velocidad = $_POST['velocidad'];
$precio = $_POST['precio'];
$estatus = $_POST['estatus'];

$query = "INSERT INTO catalogo_paquetes (
        paquetes, 
        velocidad, 
        costo, 
        estatus
        ) VALUES (
        '$nombre', 
        '$velocidad', 
        '$precio', 
        '$estatus'
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