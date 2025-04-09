<?php
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

// Generar un identificador único
$fechaActual = date("YmdHis"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = $fechaActual . strtoupper(bin2hex(random_bytes(4))); // Cadena única alfanumérica FOLIO

    if($identificadorUnico){
        echo json_encode(array(
            'success'=>1,
            'folio' => $identificadorUnico
        ));
    }
    else{
        echo json_encode(array(
            'success'=>0,
            'error' => "error"
        ));
    }
?>