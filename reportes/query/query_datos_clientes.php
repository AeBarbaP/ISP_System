<?php
require('../prcd/conn.php');
$folio = $_POST['folio'];

$sql = "SELECT * FROM clientes WHERE folio = '$folio'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
$clientes = array();

    $clientes[] = array(
        'nombre' => $row['nombre'],
        'folio' => $row['folio'],
        'domicilio' => $row['domicilio'],
        'telefono' => $row['telefono']
    );


echo json_encode($clientes);
?>