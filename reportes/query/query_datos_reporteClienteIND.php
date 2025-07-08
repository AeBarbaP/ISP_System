<?php
require('../../dashboard/prcd/conn.php');

$cliente = $_POST['val'];

$sql = "SELECT * FROM clientes WHERE folio = '$cliente'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$nombre = $row['nombre'];
$domicilio = $row['domicilio'];

echo json_encode(array(
    'success'=>1,
    'nombre'=>$nombre,
    'domicilio'=>$domicilio
));

?>