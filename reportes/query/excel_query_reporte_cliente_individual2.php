<?php
require('../prcd/conn.php');

$cliente = $_REQUEST['cliente'];
$fechaInicio = $_REQUEST['finicial'];
$fechaFinal = $_REQUEST['ffinal'];

$sql = "SELECT * FROM pagos_generales WHERE 
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

while($row = $resultado->fetch_assoc()){
    $x++;
    $totalSuma = $totalSuma + $row['total'];
    $folio = $row['folio_contrato'];
    $rowNombre = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $tipoPago = $row['tipo_pago'];
    if($tipoPago == 1){
        $pago = "Efectivo";
    }
    elseif($tipoPago == 2){
        $pago = "Tarjeta de débito";
    }
    elseif($tipoPago == 3){
        $pago = "Tarjeta de crédito";
    }
    elseif($tipoPago == 4){
        $pago = "Transferencia";
    }
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['folio_pago'].'</td>
        <td>'.$rowNombre['nombre'].'</td>
        <td>'.$row['fecha_pago'].'</td>
        <td>'.$pago.'</td>
        <td>'.$row['total'].'</td>
    </tr>
    ';
}


echo'
</tbody>
    </table>
';
?>