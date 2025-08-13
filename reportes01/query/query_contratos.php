<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM clientes WHERE MONTH(fecha_contrato) = MONTH(CURRENT_DATE()) AND YEAR(fecha_contrato) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];
    $paquete = $row['servicio'];
    $folio = $row['folio'];
    $nombre = $row['nombre'];
    $fecha_contrato = $row['fecha_contrato'];
    $direccionip = $row['direccionip'];

    //$rowComunidad = $conn->query("SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'")->fetch_assoc();
    $rowPaquete = $conn->query("SELECT * FROM catalogo_paquetes WHERE id = '$paquete'")->fetch_assoc();
    if($row['estatus'] == 1){
        $estatus = 'Activo <i class="bi bi-check-circle-fill text-success"></i>';
    }
    else{
        $estatus = 'Inactivo <i class="bi bi-x-circle-fill text-danger"></i>';
    }

    echo'
    <tr>
        <td>'.$folio.'</td>
        <td>'.$nombre.'</td>
        <td>'.$comunidad.'</td>
        <td>'.$paquete.'</td>
        <td>'.$fecha_contrato.'</td>
        <td>'.$direccionip.'</td>
        <td><a href="#" onclick="cambiarEstatusCont('.$folio.', '.$row['estatus'].')">'.$estatus.'</a></td>
        <td><i class="bi bi-clipboard2-check"></i></td>
    </tr>
    ';
}

?>