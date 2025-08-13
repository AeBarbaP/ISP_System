<?php
require('../../dashboard/prcd/conn.php');


$sql2 = "SELECT COUNT(*) AS fallas FROM incidencias WHERE MONTH(fecha_reporte) = MONTH(CURRENT_DATE()) AND YEAR(fecha_reporte) = YEAR(CURRENT_DATE())";
$resultado2 = $conn->query($sql2);
$row2 = $resultado2->fetch_assoc();

$fallas = $row['fallas'];

$sql3 = "SELECT COUNT(*) AS cortes FROM cortes WHERE MONTH(fecha) = MONTH(CURRENT_DATE()) AND YEAR(fecha) = YEAR(CURRENT_DATE())";
$resultado3 = $conn->query($sql3);
$row3 = $resultado3->fetch_assoc();

$cortes = $row['cortes'];

echo json_encode(array(
    'success'=>1,
    'cortes'=>$cortes,
    'fallas'=>$fallas
));

?>