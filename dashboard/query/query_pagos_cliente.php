<?php
require('../prcd/conn.php'); // Asegúrate de incluir la conexión a la base de datos

$folio = $_POST['folio'];
$yearActual = date("Y"); // Obtener el año actual

// Consulta para obtener los pagos del cliente en el año actual
$sql = "SELECT folio_contrato, concepto, periodo, MONTH(fecha_pago) as mes, total 
        FROM pagos 
        WHERE folio_contrato = '$folio' AND YEAR(fecha_pago) = '$yearActual'";
$resultado = $conn->query($sql);

$pagos = array();

while ($row = $resultado->fetch_assoc()) {
    $pagos[] = array(
        'folio_contrato' => $row['folio_contrato'],
        'concepto' => $row['concepto'],
        'periodo' => $row['periodo'], // Mes del pago (1 = Enero, 2 = Febrero, etc.)
        'mes' => $row['periodo'],
        'monto' => $row['total']
    );
}

echo json_encode($pagos);
?>