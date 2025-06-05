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
while($row = $resultado->fetch_assoc()){
    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['concepto'].'</td>
        <td>'.$row['periodo'].'</td>
        <td>'.$row['total'].'</td>
        
    </tr>
    ';
}

?>