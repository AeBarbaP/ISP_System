<?php
require('../prcd/conn.php');

$cliente = $_POST['cliente'];
$fechaInicio = $_POST['fechaInicio'];
$fechaFinal = $_POST['fechaFinal'];

$sql = "SELECT * FROM pagos WHERE 
folio_contrato = '$cliente' AND 
(fecha_pago BETWEEN '$fechaInicio' AND '$fechaFinal') 
ORDER BY id DESC";

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
?>