<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

// Generar un identificador único
$fechaActual = date("YmdHis"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = $_POST['folio'];

$fechaContrato = $_POST['fechaContrato'];
$nombreCompleto = $_POST['nombreCompleto'];
$domicilioContrato = $_POST['domicilioContrato'];
$catalogoComunidades = $_POST['catalogoComunidades'];
$catalogoMunicipios = $_POST['catalogoMunicipios'];
$catalogoEstados = $_POST['catalogoEstados'];
$cpContrato = $_POST['cpContrato'];
$telefonoContrato = $_POST['telefonoContrato'];
$referenciasContrato = $_POST['referenciasContrato'];
$identificacionContrato = $_POST['identificacionContrato'];
$comprobanteContrato = $_POST['comprobanteContrato'];
$catalogoPaquetes = $_POST['catalogoPaquetes'];
$antenaContrato = $_POST['antenaContrato'];
$ipAddressContrato = $_POST['ipAddressContrato'];
$inputCosto = $_POST['inputCosto'];
$siguienteMesInput = $_POST['siguienteMesInput'];
$mesMasCincoDiasInput = $_POST['mesMasCincoDiasInput'];

$estatus = 1;

$query = "INSERT INTO clientes (
        folio, 
        nombre, 
        domicilio,
        comunidad,
        municipio,
        estado,
        cp,
        telefono,
        referencias,
        identificacion,
        comprobante,
        servicio,
        antena,
        direccionip,
        fecha_contrato,
        fecha_limite,
        fecha_corte,
        cuota,
        estatus
        ) VALUES (
        '$identificadorUnico', 
        '$nombreCompleto', 
        '$domicilioContrato',
        '$catalogoComunidades',
        '$catalogoMunicipios',
        '$catalogoEstados',
        '$cpContrato',
        '$telefonoContrato',
        '$referenciasContrato',
        '$identificacionContrato',
        '$comprobanteContrato',
        '$catalogoPaquetes',
        '$antenaContrato',
        '$ipAddressContrato',
        '$fechaActual',
        '$siguienteMesInput',
        '$mesMasCincoDiasInput',
        '$inputCosto',
        '$estatus'
        )";

    $resultado = $conn->query($query);

    if($resultado){
        echo json_encode(array(
            'success'=>1
        ));

        $sqlAntena = "UPDATE antenas SET
        estatus = 0
        WHERE
        id = '$antenaContrato'
        ";
        $resultadoAntena = $conn->query($sqlAntena);

        // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        28,
        '$fechaHoy',
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