<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$sql = "SELECT * FROM cortes ORDER BY fecha DESC";
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
        $estatusIncidencia = 'Offline <i class="bi bi-wifi-off text-danger"></i>';
        $actualizar = 2;
    }
    elseif($estatus == 2){
        $estatusIncidencia = 'Online <i class="bi bi-wifi text-primary"></i>';
        $actualizar = 1;
    }
    elseif($estatus == 3){
        $estatusIncidencia = 'Cancelada <i class="bi bi-x-circle-fill"></i>';
        $actualizar = 1;
    } 

    // $estatusIncidencia = 'NA';
    echo
    '
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['folio_corte'].'</td>
        <td>'.$rowCliente['nombre'].'</td>
        <td>'.$rowCliente['domicilio'].'</td>
        <td>'.$rowTecnico['nombre'].'</td>
        <td>'.$row['fecha'].'</td>
        
        <td><a href="#" onclick="estatusCorteRep('.$row['id'].', '.$actualizar.')">'.$estatusIncidencia.'</a></td>
        
        <td><a href="#" onclick="generarReporteCorteInd2(\''.$row['folio_corte'].'\')"><i class="bi bi-eye"></i></a> | <a href="#" onclick="eliminarCorteInd(\''.$row['id'].'\')"><i class="bi bi-trash-fill"></i></a></td>
    </tr>
    ';
}