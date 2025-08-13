<?php
require('../../dashboard/prcd/conn.php');

$nombre = $_POST['nombre'];

$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$nombre%'";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];
    $paquete = $row['servicio'];
    $folio = $row['folio'];


    //$rowComunidad = $conn->query("SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'")->fetch_assoc();
    $rowPaquete = $conn->query("SELECT * FROM catalogo_paquetes WHERE id = '$paquete'")->fetch_assoc();
if($row['estatus'] == 1){
        $estatus = 'Activo <i class="bi bi-check-circle-fill text-success ms-2"></i>';
    }
    else if ($row['estatus'] == 2){
        $estatus = 'Inactivo <i class="bi bi-x-circle-fill text-warning ms-2"></i>';
    }
    else if ($row['estatus'] == 0){
        $estatus = 'Cancelado <i class="bi bi-x-circle-fill text-danger ms-2"></i>';
    }

    if ($comunidad && (is_null($comunidad) || $comunidad == "")) {
        $comunidad = "Sin datos";
    } else if ($comunidad) {
        $comunidad = $comunidad;
    } else {
        $comunidad = "Sin datos";
    }

    echo'
    <tr>
        <td>'.$row['folio'].'</td>
        <td>'.$row['nombre'].'</td>
        <td>'.$comunidad.'</td>
        <td>'.$rowPaquete['paquetes'].'</td>
        <td>'.$row['fecha_contrato'].'</td>
        <td>'.$row['direccionip'].'</td>
        <td><a href="#" onclick="cambiarEstatusCont(\''.$folio.'\', '.$row['estatus'].')">'.$estatus.'</a></td>
        <td><a href="#" onclick="editarContratos(\''.$folio.'\')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>