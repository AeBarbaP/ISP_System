<?php
require('../../dashboard/prcd/conn.php');

header("Pragma: public");
header("Expires: 0");
$filename = "reporte_pagos.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

$diaHoy = $hoy->format('d');
$mesHoy = $hoy->format('m');
$anioHoy = $hoy->format('Y');

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

$sql = "SELECT * FROM pagos_generales WHERE MONTH(fecha_pago) = $mesHoy AND YEAR(fecha_pago) = $anioHoy ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $numPago = $row['folio_pago'];
    $folioContrato = $row['folio_contrato'];
    $fechaPago = $row['fecha_pago'];
    $id = $row['id'];
    $tipoPago = $row['tipo_pago'];
    $total = $row['total'];

    $sql1 = "SELECT * FROM clientes WHERE folio = '$folioContrato'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $cliente = $row1['nombre'];

    $sql2 = "SELECT * FROM tipo_pago WHERE id = $tipoPago";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $pago = $row2['tipo'];

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$numPago.'</td>
        <td>'.$cliente.'</td>
        <td>'.$fechaPago.'</td>
        <td>'.$pago.'</td>
        <td>'.$total.'</td>
    
        <td><a href="#" onclick="queryPagoIndividual(\''.$numPago.'\'); datosPagoIndividual(\''.$folioContrato.'\')"><i class="bi bi-eye-fill"></i></a></td>
    </tr>
    ';
}

echo'
</tbody>
    </table>
';

?>