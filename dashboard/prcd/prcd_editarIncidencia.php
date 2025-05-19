<?php

require('conn.php');

$folio = $_POST['folio'];
$fecha_alta = $_POST['fecha_alta'];
$cliente = $_POST['cliente'];
$descripcion = $_POST['descripcion'];
$tecnico = $_POST['tecnico'];
$fecha_asignacion = $_POST['fecha_asignacion'];

$query = "UPDATE incidencias SET 
        fecha_reporte = '$fecha_alta', 
        folio_cliente = '$cliente', 
        comentario_tecnico = '$descripcion',
        tecnico = '$tecnico',
        fecha_resolucion = '$fecha_asignacion'
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