<?php
require('../prcd/conn.php');
$cliente = $_POST['cliente'];
$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$cliente%'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();


while($row = $resultado->fetch_assoc()){

    $paquete1 = $row['servicio'];
    if ($paquete1 == 0 || $paquete1 == '' || $paquete1 == null) {
        $paquete = 'Sin paquete';
    }
    else {
        $paquete = $paquete1;
    }
    $folio1 = $row['folio'];
    $nombre1 = $row['nombre'];
    $comunidad1 = $row['comunidad'];
    if ($comunidad1 == 0 || $comunidad1 == '' || $comunidad1 == null) {
        $comunidad = 'Sin comunidad';
    }
    else {
        $comunidad = $comunidad1;
    }
    if ($folio1 == 0 || $folio1 == '' || $folio1 == null) {
        $folio = 'Sin folio';
    }
    else {
        $folio = $folio1;
    }
    if ($nombre1 == 0 || $nombre1 == '' || $nombre1 == null) {
        $nombre = 'Sin nombre';
    }
    else {
        $nombre = $nombre1;
    }


    $sql2 = "SELECT * FROM catalogo_paquetes WHERE id = $paquete";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $clientes[] = array(
        'nombre' => $nombre,
        'folio' => $folio, // Asegúrate de incluir el folio
        'comunidad' => $comunidad,
        'paquete' => $paquete
    );
}

echo json_encode($clientes);
?>