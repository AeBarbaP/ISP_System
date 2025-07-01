<?php

require('../prcd/conn.php');

header("Pragma: public");
header("Expires: 0");
$filename = "reporte_otros_gastos.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

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
$fecha = ($_REQUEST['fecha']);
$x=0;
$cantidad = 0;
$sql = "SELECT * FROM otros_gastos WHERE id_ext = '$usr' AND fecha = '$fecha'";
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
<tr class="table-success">
    <td colspan="3" class="text-center"></td>
    <td colspan="1" class="text-center"><strong>Total: '.$cantidad.'</strong></td>
</tr>
';

echo'
    </tbody>
</table>
';

$errorr = $conn->error;
echo $errorr;

?>