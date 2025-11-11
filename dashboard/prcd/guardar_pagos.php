<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
// $userLog = $_SESSION['username'];
$userLog = $_POST['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");
$annio = strftime("%Y");

// Recibir datos
$pagos = $_POST['pagos'];

// Guardar cada pago
foreach($pagos as $pago) {
    $sql = "INSERT INTO pagos (
        num_pago,
        fecha_pago,
        folio_contrato, 
        concepto, 
        periodo,
        annio,
        tipo_pago,
        descuento, 
        total
    ) VALUES (
        '{$pago['folio_pago']}',
        '$fechaHoy',
        '{$pago['folio_contrato']}',
        '{$pago['concepto']}',
        '{$pago['periodo']}',
        '$annio',
        1,
        0,
        {$pago['costo']}
    )";
    
    $conn->query($sql);
}

// --------- log ---------------
            $sqlLOG = "INSERT INTO log_users(
            username,
            accion,
            hora,
            folio_cliente
            )
            VALUES(
            '$userLog',
            5,
            '$fechaHoy',
            'NA')
            ";
            $resultadoLOG = $conn->query($sqlLOG);
            $error = $conn->error;
            // --------- log ---------------

// Respuesta simple
echo '{"success":true}';
?>