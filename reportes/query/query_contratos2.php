<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT COUNT(*) AS contratos FROM clientes WHERE MONTH(fecha_contrato) = MONTH(CURRENT_DATE()) AND YEAR(fecha_contrato) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$contratos = $row['contratos'];

echo json_encode(array(
    'success'=>1,
    'contratos'=>$contratos
));

?>