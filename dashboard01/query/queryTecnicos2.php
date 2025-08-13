<?php
require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM tecnicos WHERE id = '$id'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success' => 1,
    'nombre' => $row['nombre'],
    'estatus' => $row['estatus']
))

?>