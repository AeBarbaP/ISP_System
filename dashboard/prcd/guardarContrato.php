<?php

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

// $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

// Generar un identificador único
$fechaActual = date("YmdHis"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = $fechaActual . strtoupper(bin2hex(random_bytes(4))); // Cadena única alfanumérica FOLIO

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
        '$catalogoPaquetes',
        '$antenaContrato',
        '$ipAddressContrato',
        '$fechaActual',
        '$siguienteMesInput',
        '$mesMasCincoDiasInput',
        '$inputCosto',
        '$estatus',
        )";

    $resultado = $conn->query($sql);

    if($resultado){
        echo json_encode(array(
            'success'=>1
        ));
    }
    else{
        echo json_encode(array(
            'success'=>0
        ));
    }

?>