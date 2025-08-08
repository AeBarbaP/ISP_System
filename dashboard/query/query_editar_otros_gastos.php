<?php
require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM otros_gastos WHERE id = '$id'";
$resultado = $conn->query($sql);

if($resultado){

$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success' => 1,
    'id' => $row['id'],
    'fecha' => $row['fecha'],
    'concepto' => $row['concepto'],
    'cantidad' => $row['cantidad']
));
}
else{
    echo json_encode(array(
        'success' => 0,
        'error' => $conn->error
    ));
}

?>