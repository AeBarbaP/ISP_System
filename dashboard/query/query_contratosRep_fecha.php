<?php
require('../../dashboard/prcd/conn.php');

$fechaInicial = $_POST['fechaInicial'];
$fechaFinal = $_POST['fechaFinal'];

$sql = "SELECT * FROM clientes WHERE fecha_contrato BETWEEN '$fechaInicial' AND '$fechaFinal'";
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
        <td>'.$estatus.'</td>
        <td><i class="bi bi-clipboard2-check"></i></td>
    </tr>
    ';
}

?>