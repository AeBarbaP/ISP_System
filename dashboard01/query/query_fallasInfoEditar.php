<?php
require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM incidencias WHERE id = '$id'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

$row = $resultado->fetch_assoc();

/* $fecha = $row['fecha_reporte']->format('Y-m-d'); */
$fecha = new DateTime($row['fecha_reporte']);
$fecha = $fecha->format('Y-m-d');

echo json_encode(array(
    'success' => 1,
    'id' => $row['id'],
    'folio_incidencia' => $row['folio_incidencia'],
    'descripcion' => $row['descripcion'],
    'folio_cliente' => $row['folio_cliente'],
    'tecnico' => $row['tecnico'],
    'estatus' => $row['estatus'],
    'fecha_reporte' => $fecha
));

?>