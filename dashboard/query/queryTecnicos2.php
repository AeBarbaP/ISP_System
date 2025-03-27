<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM tecnicos ORDER BY id DESC"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success' => 1,
    'nombre' => $row['nombre']
))

?>