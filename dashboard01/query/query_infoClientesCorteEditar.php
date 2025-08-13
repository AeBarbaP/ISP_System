<?php
    require('../prcd/conn.php');
    $folio = $_POST['folio'];

    $sqlCliente = "SELECT * FROM cortes WHERE folio_corte = '$folio'";
    $resultadoCliente = $conn->query($sqlCliente);
    $rowCliente = $resultadoCliente->fetch_assoc();
    $cliente = $rowCliente['folio_cliente'];
    $fecha = $rowCliente['fecha'];

    $sql = "SELECT * FROM clientes WHERE folio = '$cliente'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();
    $clientes = array();

    $comunidad = $row['comunidad'];
    

    $clientes = array(
        'success'=> 1,
        'nombre' => $row['nombre'],
        'domicilio' => $row['domicilio'],
        'comunidad' => $comunidad,
        'fecha' => $fecha
    );


    echo json_encode($clientes);
?>