<?php
require('../../dashboard/prcd/conn.php');

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

$diaHoy = $hoy->format('d');
$mesHoy = $hoy->format('m');
$anioHoy = $hoy->format('Y');

$folio = $_POST['folioPago'];

$sql = "SELECT * FROM pagos WHERE num_pago = '$folio' ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
$total2 = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $numPago = $row['num_pago'];
    $concepto = $row['concepto'];
    $periodo = $row['periodo'];
    $folioContrato = $row['folio_contrato'];
    $fechaPago = $row['fecha_pago'];
    $id = $row['id'];
    $tipoPago = $row['tipo_pago'];
    $total = $row['total'];

    $total2 = $total2 + $total;

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
        <td>'.$concepto.'</td>
        <td>'.$periodo.'</td>
        <td>'.$total.'</td>
    </tr>
    ';
}

echo'
<tr>
    <td class="table-success text-end" colspan="3">Total</td>
    <td class="table-success">'.$total2.'</td>
</tr>
';

?>