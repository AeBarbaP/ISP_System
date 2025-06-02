<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

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
        // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        15,
        $fechaHoy,
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
        
    }
    else{
        $error = $conn->error;
        echo json_encode(array(
            'success'=>0,
            'error' => $error
        ));
    }

?>