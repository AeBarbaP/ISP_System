<?php

require('conn.php');

$folio = $_POST['usuario'];
$estatus = $_POST['estatus'];
$fechaAtencion = $_POST['fechaAtencion'];
$comentario = $_POST['comentario'];

$query = "UPDATE incidencias SET 
        estatus = '$estatus',
        fecha_resolucion = '$fechaAtencion',
        estatus = '$estatus',
        comentario_tecnico = '$comentario'
        WHERE folio_incidencia = '$folio'
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