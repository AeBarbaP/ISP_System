<?php
require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM promociones WHERE id = '$id'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success' => 1,
    'nombre_promocion' => $row['promo'],
    'tipo_promocion' => $row['tipo'],
    'descuento_promo' => $row['descuento'],
    'fecha_inicio' => $row['fecha_inicio'],
    'fecha_fin' => $row['fecha_fin']
))

?>