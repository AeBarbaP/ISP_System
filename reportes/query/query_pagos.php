<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM pagos ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $numPago = $row['num_pago'];
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
        <td>'.$numPago.'</td>
        <td>'.$cliente.'</td>
        <td>'.$fechaPago.'</td>
        <td>'.$pago.'</td>
        <td>'.$total.'</td>
    
        <td><a href="#" data-bs-toggle="modal" data-bs-target="#reportePagoIndividual" onclick="queryPagoIndividual()"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>