<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

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