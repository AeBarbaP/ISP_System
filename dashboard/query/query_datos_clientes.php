<?php
require('../prcd/conn.php');
$folio = $_POST['folio'];

$sql = "SELECT * FROM clientes WHERE folio = '$folio'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();

    $paquete = $row['servicio'];
    $folio = $row['folio'];

    $sql2 = "SELECT * FROM catalogo_paquetes WHERE id = $paquete";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $sql3 = "SELECT * FROM pagos_generales WHERE folio_contrato = '$folio' ORDER BY fecha_pago DESC LIMIT 1";
    $resultado3 = $conn->query($sql3);
    $row3 = $resultado3->fetch_assoc();

    $filas = $resultado3->num_rows;
    
    if ($filas == 0){
        $pagos = 0;
        $fecha1 = "";
        $total1 = "";
    } 
    else {
        $pagos = 1;
        $fecha1 = $row3['fecha_pago'];
        $total1 = $row3['total'];
    }


    if ($fecha1 == null || $fecha1 == '') {
        $fecha = '';
    } else{
        $fecha = date('d-m-Y', strtotime($fecha1));
    }
    if ($total1 == null || $total1 == '') {
        $total = 'No hay pagos registrados';
    } else {
        $total = 'por $' . number_format($total1, 2);
    }



    $clientes = array();


    $clientes[] = array(
        'nombre' => $row['nombre'],
        'folio' => $row['folio'],
        'domicilio' => $row['domicilio'],
        'telefono' => $row['telefono'],
        'comunidad' => $row['comunidad'],
        'paquete' => $row2['paquetes'],
        'ultimopago' => $fecha,
        'total' => $total,
        'pagos' => $pagos,
        'cuota' => $row['cuota']
    );


echo json_encode($clientes);
?>