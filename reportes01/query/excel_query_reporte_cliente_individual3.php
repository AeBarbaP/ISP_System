<?php
require('../prcd/conn.php');

$cliente = $_REQUEST['cliente'];
$fechaInicio = $_REQUEST['finicial'];
$fechaFinal = $_REQUEST['ffinal'];

$sql = "SELECT * FROM pagos WHERE 
folio_contrato = '$cliente' AND 
(fecha_pago BETWEEN '$fechaInicio' AND '$fechaFinal') 
ORDER BY id DESC";

header("Pragma: public");
header("Expires: 0");
$filename = "reporte_individual_clientes.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");


$resultado = $conn->query($sql);
$x = 0;
$totalSuma = 0;
echo'
<table>
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Folio</th>
            <th scope="col">Cliente</th>
            <th scope="col">Fecha Pago</th>
            <th scope="col">Tipo Pago</th>
            <th scope="col">Total</th>
        </tr>
    </thead>
    <tbody>
';

$resultado = $conn->query($sql);
$x = 0;
$totalSuma = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $totalSuma = $totalSuma + $row['total'];

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['concepto'].'</td>
        <td>'.$row['periodo'].'</td>
        <td>'.$row['total'].'</td>
        
    </tr>
    ';
}
echo'
<tr class="table-info">
    <td colspan="2" class="text-center"></td>
    <td colspan="1" class="text-center"><strong>Total:</strong></td>
    <td colspan="1" class="text-center">'.$totalSuma.'</td>
</tr>
';


echo'
</tbody>
    </table>
';
?>