<?php
session_start();

require('conn.php');


$username = $_SESSION['username'];
$fecha_orden = $_POST['fecha_orden'];
$folio = $_POST['folio'];
$folio_cliente = $_POST['folio_cliente'];
/* $tecnico = $_POST['tecnico']; */
$fecha_asignacion = $_POST['fecha_asignacion'];

$query = "INSERT INTO cortes (
        folio_cliente,
        username,
        folio_corte,
        fecha,
        estatus
        ) VALUES (
        '$folio_cliente',
        '$username',
        '$folio',
        '$fecha_asignacion',
        1
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