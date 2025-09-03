<?php
header('Content-Type: application/json');
session_start();

require('conn.php');


date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$folio_pago = $_POST['folio_pago'];
$fecha_pago = $_POST['fecha_pago'];
$tipo_pago = $_POST['tipo_pago'];
$folio_contrato = $_POST['folio_contrato'];
$total_pago = $_POST['total_pago'];
$periodo = $_POST['periodop'];

if ($tipo_pago != 1){
    $tarjeta =  $_POST['tarjeta'];
}
else {
    $tarjeta = "";
}

$sql = "INSERT INTO pagos_generales (
        folio_contrato, 
        total, 
        tarjeta, 
        folio_pago,
        fecha_pago,
        tipo_pago,
        periodo,
        id_ext
        ) VALUES (
        '$folio_contrato', 
        '$total_pago',
        '$tarjeta',
        '$folio_pago', 
        '$fecha_pago',
        '$tipo_pago',
        '$periodo',
        '$userLog'
        )";

        $resultado = $conn->query($sql);
        
        if($resultado){
            // --------- log ---------------
            $sqlLOG = "INSERT INTO log_users(
            username,
            accion,
            hora,
            folio_cliente
            )
            VALUES(
            '$userLog',
            6,
            '$fechaHoy',
            'NA')
            ";
            $resultadoLOG = $conn->query($sqlLOG);
            $error = $conn->error;
            // --------- log ---------------

            echo json_encode(array(
                'success' => 1
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