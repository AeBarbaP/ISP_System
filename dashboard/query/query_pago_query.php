<?php
require('../prcd/conn.php');

$folio = $_POST['folio'];

$sql = "SELECT * FROM pagos_generales WHERE folio_contrato = '$folio'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
$folio_contrato = $row['folio_contrato'];
$folio_pago = $row['folio_pago'];

$sqlNombre = "SELECT * FROM clientes WHERE folio = '$folio_contrato'";
$resultadoNombre = $conn->query($sqlNombre);
$rowNombre = $resultadoNombre->fetch_assoc();

$sqlPagos ="SELECT * FROM pagos WHERE folio_pago = '$folio_pago'";
$resultadoPagos = $conn->query($sqlPagos);
$rowPagos = $resultadoPagos->fetch_assoc();

// generar listado de pagos con while

$nombre = $rowNombre['nombre'];
$fechaPago = $rowNombre['fecha_corte'];
$folio = $rowNombre['folio'];
$total = $rowNombre['cuota'];

echo json_encode(array(
    'success' => 1,
    'nombre' => $nombre,
    'fechaPago' => $fechaPago,
    'folio' => $folio,
    'total' => $total
));


?>