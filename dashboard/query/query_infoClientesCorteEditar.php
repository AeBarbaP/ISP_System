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

    $comunidad = $row1['comunidad'];

    $clientes = array(
        'success'=> 1,
        'nombre' => $row['nombre'],
        'domicilio' => $row['domicilio'],
        'comunidad' => $comunidad,
        'fecha' => $fecha
    );


    echo json_encode($clientes);
?>