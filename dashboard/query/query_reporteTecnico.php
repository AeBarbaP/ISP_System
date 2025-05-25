<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM incidencias WHERE estatus = 1"; // 
$resultado = $conn->query($sql);

echo '<option selected>Selecciona incidencia activa...</option>';
while($row = $resultado->fetch_assoc()){
    $folio_incidencia = $row['folio_incidencia'];
    $folio_cliente = $row['folio_cliente'];

    $sql1 = "SELECT * FROM clientes WHERE folio = '$folio_cliente'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $cliente = $row1['nombre'];
    $domicilio = $row1['domicilio'];

    echo '<option value="'.$folio_incidencia.'" data-username="'.$folio_cliente.'" onclick="querySelectCliente()">'.$folio_incidencia.' | '.$cliente.' | '.$domicilio.'</option>';
}

?>