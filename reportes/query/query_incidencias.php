<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT COUNT(*) AS incidencias FROM incidencias WHERE MONTH(fecha_reporte) = MONTH(CURRENT_DATE()) AND YEAR(fecha_reporte) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$incidencias = $row['incidencias'];

echo json_encode(array(
    'success'=>1,
    'incidencia'=>$incidencias
));

?>