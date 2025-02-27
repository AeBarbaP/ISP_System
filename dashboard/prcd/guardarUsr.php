<?php

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

// $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

// Generar un identificador único
$fechaActual = date("YmdHis"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = $fechaActual . strtoupper(bin2hex(random_bytes(4))); // Cadena única alfanumérica FOLIO

$usrNew = $_POST['usrNew'];
$pwdNew = $_POST['pwdNew'];
$nombreNew = $_POST['nombreNew'];
$tipoUsrNew = $_POST['tipoUsrNew'];
$estatusNew = $_POST['estatusNew'];

$query = "INSERT INTO users (
        username, 
        pwd, 
        nombre,
        tipo_usr,
        estatus
        ) VALUES (
        '$usrNew', 
        '$pwdNew', 
        '$nombreNew',
        '$tipoUsrNew',
        '$estatusNew'
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