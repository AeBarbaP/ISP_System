<?php
    require('../prcd/conn.php');
    $folio = $_POST['folio'];

    $sql = "SELECT * FROM clientes WHERE folio = '$folio'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();
    $clientes = array();

    $comunidad1 = $row['comunidad'];
    
    $sql1 = "SELECT * FROM catalogo_comunidades WHERE id = '$comunidad1'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    if ($row1 && (is_null($row1['comunidad']) || $row1['comunidad'] == "")) {
    $comunidad = "Sin datos";
    } else if ($row1) {
        $comunidad = $row1['comunidad'];
    } else {
        $comunidad = "Sin datos";
    }

    if ($row1 && (is_null($row['domicilio']) || $row['domicilio'] == "")) {
    $domicilio = "Sin datos";
    } else if ($row1) {
        $domicilio = $row['domicilio'];
    } else {
        $domicilio = "Sin datos";
    }

    $clientes = array(
        'nombre' => $row['nombre'],
        'domicilio' => $domicilio,
        'comunidad' => $comunidad,
        'success'=> 1
    );


    echo json_encode($clientes);
?>