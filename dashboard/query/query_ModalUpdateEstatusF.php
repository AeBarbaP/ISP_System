<?php
    require('../prcd/conn.php');

    $id = $_POST['id'];

    $sql = "SELECT * FROM incidencias WHERE id = '$id'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);

    $row = $resultado->fetch_assoc();

    /* $fecha = $row['fecha_reporte']->format('Y-m-d'); */
    $fecha = new DateTime($row['fecha_reporte']);
    $fecha = $fecha->format('Y-m-d');
    $fecha2 = new DateTime($row['fecha_reporte']);
    $fecha2 = $fecha2->format('Y-m-d');
    $folio = $row['folio_cliente'];

    $sql1 = "SELECT * FROM clientes WHERE folio = '$folio'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $cliente = $row1['nombre'];

    $sql2 = "SELECT * FROM tecnicos WHERE estatus = 1 ORDER BY id DESC";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $tecnico = $row2['nombre'];

    echo json_encode(array(
        'success' => 1,
        'folio_incidencia' => $row['folio_incidencia'],
        'descripcion' => $row['descripcion'],
        'cliente' => $cliente,
        'folio_cliente' => $folio,
        'tecnico' => $tecnico,
        'estatus' => $row['estatus'],
        'asignacion' => $fecha2,
        'fecha_reporte' => $fecha
    ));

?>