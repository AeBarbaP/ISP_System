<?php
    require('../prcd/conn.php');
    $folio = $_POST['folio'];

    $sql = "SELECT * FROM clientes WHERE folio = '$folio'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();
    $clientes = array();

    $comunidad1 = $row['comunidad'];
    

    if ($comunidad1 && (is_null($comunidad1) || $comunidad1 == "")) {
        $comunidad = "Sin datos";
    } else {
        $comunidad = $comunidad1;
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