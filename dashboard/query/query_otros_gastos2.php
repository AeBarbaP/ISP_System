<?php

require('../prcd/conn.php');

$usr = $_POST['usr'];
$fecha = $_POST['fecha'];
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

?>