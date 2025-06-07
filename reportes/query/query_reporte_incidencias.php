<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$sql = "SELECT * FROM incidencias ORDER BY fecha_reporte DESC";
$resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
    $x++;
    $folio = $row['folio_cliente'];
    $tecnico = $row['tecnico'];
    $estatus = $row['estatus'];

    $rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $rowTecnico = $conn->query("SELECT * FROM tecnicos WHERE id = '$tecnico'")->fetch_assoc();

    if($estatus == 1){
        $estatusIncidencia = "Incidencia activa";
    }
    elseif($estatus == 2){
        $estatusIncidencia = "Incidencia resuelta";
    }

    echo
    '
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['folio_incidencia'].'</td>
        <td>'.$row['descripcion'].'</td>
        <td>'.$rowCliente['nombre'].'</td>
        <td>'.$rowTecnico['nombre'].'</td>
        <td>'.$row['fecha_reporte'].'</td>
        <td>'.$row['fecha_resolucion'].'</td>
        <td>'.$estatusIncidencia.'</td>
    </tr>
    ';
}