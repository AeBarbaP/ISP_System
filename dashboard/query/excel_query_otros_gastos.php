<?php
require('../prcd/conn.php');

header("Pragma: public");
header("Expires: 0");
$filename = "reporte_otros_gastos.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fechaHoy = strftime("%Y-%m-%d");

echo'
<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Concepto</th>
            <th>Fecha</th>
            <th>Cantidad</th>
        </tr>
    </thead>
<tbody>
';

$usr = $_REQUEST['usr'];
$x=0;
$cantidad = 0;
$sql = "SELECT * FROM otros_gastos WHERE id_ext = '$usr' AND fecha = '$fechaHoy'";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $x++;
    $cantidad = $cantidad + $row['cantidad'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['concepto'].'</td>
        <td>'.$row['fecha'].'</td>
        <td>'.$row['cantidad'].'</td>
    </tr>
    ';
}

echo'
<tr>
    <td colspan="4" class="text-end">Total: '.$cantidad.'</td>
</tr>
';

echo'
</tbody>
    </table>
';

?>