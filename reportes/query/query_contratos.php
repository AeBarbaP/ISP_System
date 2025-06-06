<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM clientes WHERE MONTH(fecha_contrato) = MONTH(CURRENT_DATE()) AND YEAR(fecha_contrato) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];
    $paquete = $row['servicio'];

    $rowComunidad = $conn->query("SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'")->fetch_assoc();
    $rowPaquete = $conn->query("SELECT * FROM catalogo_paquetes WHERE id = '$paquete'")->fetch_assoc();
    if($row['estatus'] == 1){
        $estatus = "Activo";
    }
    else{
        $estatus = "Inactivo";

    }

    echo'
    <tr>
        <td>'.$row['folio'].'</td>
        <td>'.$row['nombre'].'</td>
        <td>'.$rowComunidad['comunidad'].'</td>
        <td>'.$rowPaquete['paquetes'].'</td>
        <td>'.$row['fecha_contrato'].'</td>
        <td>'.$row['direccionip'].'</td>
        <td>'.$estatus.'</td>
        <td><i class="bi bi-clipboard2-check"></i></td>
    </tr>
    ';
}

?>