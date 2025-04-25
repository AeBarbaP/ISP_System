<?php

require('conn.php');

$folio_pago = $_POST['folio_pago'];
$fecha_pago = $_POST['fecha_pago'];
$tipo_pago = $_POST['tipo_pago'];
$folio_contrato = $_POST['folio_contrato'];
$total_pago = $_POST['total_pago'];

if ($tipo_pago == 1){
    $tarjeta = "";
}
else {
    $tarjeta =  $_POST['tarjeta'];
}

$sql = "INSERT INTO pagos_generales (
        folio_contrato, 
        total, 
        tarjeta, 
        folio_pago,
        fecha_pago,
        tipo_pago
        ) VALUES (
        '$folio_contrato', 
        '$total_pago',
        '$tarjeta',
        '$folio_pago', 
        '$fecha_pago',
        '$tipo_pago'
        )";
        $resultado = $conn->query($sql);
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