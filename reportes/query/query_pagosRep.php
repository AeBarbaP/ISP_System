<?php
require('../../dashboard/prcd/conn.php');

$nombre = $_POST['nombre'];

$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$nombre%'";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];
    $paquete = $row['servicio'];
    $folio = $row['folio'];

    $rowComunidad = $conn->query("SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'")->fetch_assoc();

    if($row['estatus'] == 1){
        $estatus = "Activo";
    }
    else{
        $estatus = "Inactivo";
    }

    $rowPaquete = $conn->query("SELECT * FROM catalogo_paquetes WHERE id = '$paquete'")->fetch_assoc();

    if ($rowComunidad && (is_null($rowComunidad['comunidad']) || $rowComunidad['comunidad'] == "")) {
    $comunidad = "Sin datos";
    } else if ($rowComunidad) {
        $comunidad = $rowComunidad['comunidad'];
    } else {
        $comunidad = "Sin datos";
    }


    while ($rowPago = $conn->query("SELECT * FROM pagos_generales WHERE folio_contrato = '$folio'")->fetch_assoc()){

        echo'
        <tr>
            <td>'.$row['folio'].'</td>
            <td>'.$rowPago['folio_pago'].'</td>
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
}

?>