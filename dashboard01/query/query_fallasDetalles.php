<?php
    require('../prcd/conn.php');

    $folio = $_POST['folio'];

    $sql = "SELECT * FROM incidencias WHERE folio_incidencia = '$folio'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);

    $row = $resultado->fetch_assoc();

    /* $fecha = $row['fecha_reporte']->format('Y-m-d'); */
    $fecha = new DateTime($row['fecha_reporte']);
    $fecha = $fecha->format('Y-m-d');
    $folio = $row['folio_cliente'];

    $sql1 = "SELECT * FROM clientes WHERE folio = '$folio'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $cliente = $row1['nombre'];

    echo json_encode(array(
        'success' => 1,
        'id' => $row['id'],
        'folio_incidencia' => $row['folio_incidencia'],
        'descripcion' => $row['descripcion'],
        'cliente' => $cliente,
        'folio_cliente' => $folio,
        'tecnico' => $row['tecnico'],
        'estatus' => $row['estatus'],
        'fecha_reporte' => $fecha
    ));

?>