<?php
session_start();
require('../prcd/conn.php');

header("Pragma: public");
header("Expires: 0");
$filename = "reporte_otros_gastos.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

// date_default_timezone_set('America/Mexico_City');
// setlocale(LC_TIME, 'es_MX.UTF-8');
// $fechaHoy = date('Y-m-d'); // Formato: 2023-05-20
$fechaHoy = $_REQUEST['fecha'];
$id = $_REQUEST['usr'];
$x=0;

echo'
<table>
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Descripción</th>
            <th scope="col">Fecha</th>
            <th scope="col">Estatus</th>
        </tr>
    </thead>
    <tbody">
';

$sql = "SELECT * FROM corte_caja WHERE usr = '$id' AND estatus = 1 AND DATE(fecha) = '$fechaHoy' ORDER BY fecha DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()) {
    $x++;
    $fecha = date('d-m-Y', strtotime($row['fecha']));
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>Corte de caja</td>
        <td>'.$fecha.'</td>
        <td>'.$row['estatus'].'</td>
        
    </tr>';
}

echo'
</tbody>
    </table>
';

?>
