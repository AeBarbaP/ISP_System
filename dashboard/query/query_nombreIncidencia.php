<?php
require('../prcd/conn.php');

$usuario = $_POST['usuario'];

$sql = "SELECT * FROM clientes WHERE folio = '$usuario'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success'=>1,
    'usuario'=>$row['nombre']
));


?>