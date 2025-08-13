<?php
require('../../dashboard/prcd/conn.php');
header("Pragma: public");
header("Expires: 0");
$filename = "reporte_contratos.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

echo'
<table>
    <thead>
        <tr>
            <th scope="col">Folio</th>
            <th scope="col">Cliente</th>
            <th scope="col">Localidad</th>
            <th scope="col">Paquete</th>
            <th scope="col">Fecha contrato</th>
            <th scope="col">IP</th>
            <th scope="col">Estatus</th>
        </tr>
    </thead>
    <tbody>
';

$sql = "SELECT * FROM clientes WHERE MONTH(fecha_contrato) = MONTH(CURRENT_DATE()) AND YEAR(fecha_contrato) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];
    $paquete = $row['servicio'];

    //$rowComunidad = $conn->query("SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'")->fetch_assoc();
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
        <td>'.$comunidad.'</td>
        <td>'.$rowPaquete['paquetes'].'</td>
        <td>'.$row['fecha_contrato'].'</td>
        <td>'.$row['direccionip'].'</td>
        <td>'.$estatus.'</td>
        <td><i class="bi bi-clipboard2-check"></i></td>
    </tr>
    ';
}

echo'
</tbody>
    </table>
';

?>