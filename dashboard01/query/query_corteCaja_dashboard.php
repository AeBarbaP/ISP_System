<?php
session_start();
require('../prcd/conn.php');

// date_default_timezone_set('America/Mexico_City');
// setlocale(LC_TIME, 'es_MX.UTF-8');
// $fechaHoy = date('Y-m-d'); // Formato: 2023-05-20
$fechaHoy = $_POST['fecha'];
$id = $_POST['usr'];
$x=0;

$sql = "SELECT * FROM corte_caja WHERE usr = '$id' AND estatus = 1 AND DATE(fecha) = '$fechaHoy' ORDER BY fecha DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()) {
    $x++;
    $fecha = date('d-m-Y', strtotime($row['fecha']));
    $estatus = $row['estatus'];

    if($estatus == 1){
        $estatusA = "Activo";
    }
    else{
        $estatusA = "No activo";
    }

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>Corte de caja</td>
        <td>'.$fecha.'</td>
        <td>'.$estatusA.'</td>
        <td><a href="prcd/reporte_corte_por_fecha.php?usr='.$id.'&fecha='.$fecha.'" target="_blank"><i class="bi bi-eye-fill"></i></a></td>
    </tr>';
}

?>
