<?php
include('conn.php');
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$sql ="SELECT * FROM pagos ORDER BY id ASC LIMIT 1";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;

if ($filas > 0) {
    $row = $resultado->fetch_assoc();
    $consecutivo = $row['id'];
    $consecutivo = $consecutivo + 1;
}
else{
    $consecutivo = 1;
}

if (strlen($consecutivo == 1)){
    $consecutivo = "000".$consecutivo;
}

else if (strlen($consecutivo == 2)){
    $consecutivo = "00".$consecutivo;
}

else if (strlen($consecutivo == 3)){
    $consecutivo = "0".$consecutivo;
}


// Generar un identificador único
$fechaActual = date("Y"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = "CW".$fechaActual."-".$consecutivo; // Cadena única alfanumérica FOLIO

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