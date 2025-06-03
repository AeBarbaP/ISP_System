<?php
session_start();
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

header('Content-Type: application/json');
require('conn.php');

try {
    // Verificar si se recibieron datos
    if (!isset($_POST['pagos'])) {
        throw new Exception('No se recibió el array de pagos');
    }

    $pagos = $_POST['pagos'];
    $results = [];
    $conn->begin_transaction();

    foreach ($pagos as $index => $pago) {
        // Validar campos requeridos
        $requiredFields = [
            'folio_pago' => 'Número de pago',
            'folio_contrato' => 'Folio de contrato',
            'fechaSolicitud' => 'Fecha de pago',
            'concepto' => 'Concepto',
            'periodo' => 'Periodo',
            'costo' => 'Monto total'
        ];

        $missingFields = [];
        foreach ($requiredFields as $field => $description) {
            if (empty($pago[$field])) {
                $missingFields[] = $description;
            }
        }

        if (!empty($missingFields)) {
            throw new Exception(sprintf(
                "Faltan campos requeridos en el pago #%d: %s",
                $index + 1,
                implode(', ', $missingFields)
            ));
        }

        // Validar formato de los datos
        if (!is_numeric($pago['costo'])) {
            throw new Exception("El monto total debe ser numérico en el pago #" . ($index + 1));
        }

        // Preparar consulta SQL con la estructura exacta de tu tabla
        $stmt = $conn->prepare("INSERT INTO pagos (
            num_pago, fecha_pago, folio_contrato, concepto, 
            periodo, annio, tipo_pago, descuento, total
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

        if (!$stmt) {
            throw new Exception("Error al preparar la consulta: " . $conn->error);
        }

        // Valores por defecto para campos no obligatorios
        $annio = !empty($pago['annio']) ? $pago['annio'] : date('Y');
        $tipo_pago = !empty($pago['tipo_pago']) ? $pago['tipo_pago'] : 1;
        $descuento = !empty($pago['descuento']) ? $pago['descuento'] : 0.00;
        $costo = intval($pago['costo'],0);

        // Vincular parámetros según tipos de datos de tu tabla
        $bound = $stmt->bind_param(
            "sssssiidd", // Tipos: s=string, i=integer, d=decimal
            $pago['folio_pago'],
            $pago['fechaSolicitud'],
            $pago['folio_contrato'],
            $pago['concepto'],
            $pago['periodo'],
            $annio,
            $tipo_pago,
            $descuento,
            $pago['costo']
        );

        if (!$bound) {
            throw new Exception("Error al vincular parámetros: " . $stmt->error);
        }

        if (!$stmt->execute()) {
            throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
        }

        $results[] = [
            'id' => $conn->insert_id,
            'num_pago' => $pago['folio_pago']
        ];
        $stmt->close();
    }

    $conn->commit();
    
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
    
        echo json_encode([
        'success' => true, 
        'message' => count($results) . ' pagos guardados correctamente',
        'data' => $results
    ]);


} catch (Exception $e) {
    if (isset($conn) && method_exists($conn, 'rollback')) {
        $conn->rollback();
    }
    
    $errorResponse = [
        'success' => false,
        'message' => $e->getMessage(),
        'error_details' => [
            'db_error' => isset($conn) ? $conn->error : null,
            'stmt_error' => isset($stmt) ? $stmt->error : null
        ]
    ];
    
    error_log("Error en guardar_pagos.php: " . print_r($errorResponse, true));
    echo json_encode($errorResponse);
}

if (isset($conn)) {
    $conn->close();
}
?>