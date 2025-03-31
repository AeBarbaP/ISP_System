<?php
require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM users WHERE id = '$id'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success' => 1,
    'username' => $row['username'],
    'nombre' => $row['nombre'],
    'pwd' => $row['pwd'],
    'tipo_usr' => $row['tipo_usr'],
    'estatus' => $row['estatus']
));

?>