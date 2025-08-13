<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT DATE(fecha_pago) as fecha_dia, COUNT(*) as total_pagos 
        FROM pagos_generales 
        WHERE MONTH(fecha_pago) = MONTH(CURRENT_DATE()) 
        AND YEAR(fecha_pago) = YEAR(CURRENT_DATE())
        GROUP BY DATE(fecha_pago)
        ORDER BY fecha_dia ASC";

$resultado = $conn->query($sql);
$pagosPorDia = array();

while($row = $resultado->fetch_assoc()) {
    $pagosPorDia[] = array(
        'fecha' => $row['fecha_dia'],
        'total_pagos' => (int)$row['total_pagos']
    );
}

header('Content-Type: application/json');
echo json_encode($pagosPorDia);
?>