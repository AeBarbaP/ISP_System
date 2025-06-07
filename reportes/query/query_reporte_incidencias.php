<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$sql = "SELECT * FROM incidencias ORDER BY fecha_reporte DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
$x++;
    echo
    '
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['folio_incidencia'].'</td>
        <td>'.$row['descripcion'].'</td>
        <td>'.$row['folio_cliente'].'</td>
        <td>'.$row['tecnico'].'</td>
        <td>'.$row['fecha_reporte'].'</td>
        <td>'.$row['fecha_resolucion'].'</td>
        <td>'.$row['estatus'].'</td>
    </tr>
    ';
}