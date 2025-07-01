<?php
session_start();
require('../prcd/conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fechaHoy = date('Y-m-d'); // Formato: 2023-05-20

$id = $_SESSION['idUsr'];

$sql = "SELECT * FROM corte_caja WHERE usr = '$id' AND estatus = 1 AND DATE(fecha) = '$fechaHoy'";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()) {
    $fecha = date('d-m-Y', strtotime($row['fecha']));
    echo'
    <tr>
        <td>Corte de caja</td>
        <td>'.$fecha.'</td>
        <td>'.$row['estatus'].'</td>
        <td><a href="prcd/reporte_corte_por_fecha.php?usr='.$id.'&fecha='.$fecha.'" target="_blank"><i class="bi bi-eye-fill"></i></a></td>
    </tr>';
}

?>
