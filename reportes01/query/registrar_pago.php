<?php
require('../prcd/conn.php'); // Asegúrate de incluir la conexión a la base de datos

$folioPago = $_POST['folioPago'];
$folio = $_POST['folio'];
$mes = $_POST['mes'];
$concepto = 1;
$monto = 350;
$tipoPago = 1;
$descuento = 0;
// $fechaPago = date("Y-m-d-"); // Fecha actual
$fechaPago = date("Y-m-d-H-i-s"); //  Fecha y hora

// Consulta para insertar el pago
$sql = "INSERT INTO pagos (
        num_pago,
        folio_contrato, 
        concepto, 
        periodo, 
        total, 
        fecha_pago,
        tipo_pago,
        descuento
        )
        VALUES (
        '$folioPago',
        '$folio', 
        '$concepto', 
        '$mes', 
        '$monto', 
        '$fechaPago',
        '$tipoPago',
        '$descuento'
        )";

if ($conn->query($sql) === TRUE) {
    echo json_encode(array(
        "success" => true, 
        "message" => "Pago registrado correctamente."
    ));
} else {
    echo json_encode(array(
        "success" => false, 
        "message" => "Error al registrar el pago: " . $conn->error));
}

$conn->close();
?>