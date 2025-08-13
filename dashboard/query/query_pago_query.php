<?php
require('../prcd/conn.php');

$folio = $_POST['folio'];

$sql = "SELECT * FROM pagos_generales WHERE folio_pago = '$folio'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
$folio_contrato = $row['folio_contrato'];
$folio_pago = $row['folio_pago'];

$sqlNombre = "SELECT * FROM clientes WHERE folio = '$folio_contrato'";
$resultadoNombre = $conn->query($sqlNombre);
$rowNombre = $resultadoNombre->fetch_assoc();

$sqlPagos ="SELECT * FROM pagos WHERE num_pago LIKE '$folio_pago%'";
$resultadoPagos = $conn->query($sqlPagos);
// $rowPagos = $resultadoPagos->fetch_assoc();

// generar listado de pagos con while
$listado = array();
while ($rowPagos = $resultadoPagos->fetch_assoc()) {
    $listado[] = array(
        'num_pago' => $rowPagos['num_pago'],
        'fecha_pago' => $rowPagos['fecha_pago'],
        'periodo' => $rowPagos['periodo'],
        'monto' => $rowPagos['total'],
        'concepto' => $rowPagos['concepto']
    );
}

$nombre = $rowNombre['nombre'];
$fechaPago = $row['fecha_pago'];
$folio = $rowNombre['folio'];
$comunidad = $rowNombre['comunidad'];
$periodo = $row['periodo'];
$total = $row['total'];

echo json_encode(array(
    'success' => 1,
    'nombre' => $nombre,
    'fechaPago' => $fechaPago,
    'periodo' => $periodo,
    'comunidad' => $comunidad,
    'folio' => $folio_contrato,
    'folio_pago' => $folio_pago,
    'total' => $total,
    'listado' => $listado
));


?>