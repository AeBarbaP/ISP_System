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
        <td><i class="bi bi-eye"></i></td>
    </tr>
    ';
}
?>