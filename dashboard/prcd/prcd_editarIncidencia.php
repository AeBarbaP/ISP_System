<?php

require('conn.php');

$folio = $_POST['folio'];
$descripcion = $_POST['descripcion'];
$tecnico = $_POST['tecnico'];
$fecha_asignacion = $_POST['fecha_asignacion'];

$query = "UPDATE incidencias SET 
        descripcion = '$descripcion',
        tecnico = '$tecnico',
        fecha_asignacion = '$fecha_asignacion',
        estatus = 1
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