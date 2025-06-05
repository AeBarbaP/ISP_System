<?php
require('../prcd/conn.php');
$cliente = $_POST['cliente'];
$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$cliente%'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();


while($row = $resultado->fetch_assoc()){

    $paquete = $row['servicio'];

    $sql2 = "SELECT * FROM catalogo_paquetes WHERE id = $paquete";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $clientes[] = array(
        'nombre' => $row['nombre'],
        'folio' => $row['folio'], // Asegúrate de incluir el folio
        'comunidad' => $row['comunidad'],
        'paquete' => $row2['paquetes']
    );
}

echo json_encode($clientes);
?>