<?php

require('conn.php');

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