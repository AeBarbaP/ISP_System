<?php
require('../prcd/conn.php');

$cliente = $_POST['cliente'];
$fechaInicio = $_POST['fechaInicio'];
$fechaFinal = $_POST['fechaFinal'];

$sql = "SELECT * FROM pagos_generales WHERE 
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
        <td>'.$row['folio_pago'].'</td>
        <td>'.$row['folio_contrato'].'</td>
        <td>'.$row['fecha_pago'].'</td>
        <td>'.$row['tipo_pago'].'</td>
        <td>'.$row['total'].'</td>
        <td><i class="bi bi-eye"></i></td>
    </tr>
    ';
}

echo json_encode($clientes);
?>