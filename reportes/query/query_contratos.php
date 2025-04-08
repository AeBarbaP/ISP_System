<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM clientes ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    $comunidad = $row['comunidad'];
    $servicio = $row['servicio'];
    $id = $row['id'];

    $sql1 = "SELECT * FROM catalogo_comunidades WHERE id = $comunidad";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $sql2 = "SELECT * FROM catalogo_paquetes WHERE id = $servicio";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    echo'
    <tr>
        <td>'.$row['folio'].'</td>
        <td>'.$row['nombre'].'</td>
        <td>'.$row1['comunidad'].'</td>
        <td>'.$row2['paquetes'].'</td>
        <td>'.$row['fecha_contrato'].'</td>
        <td>'.$row['direccionip'].'</td>
        
        ';
        if($estatus == 1){
            echo'
            <td><a href="#" onclick="cambiaEstatusContrato('.$id.')"><i class="bi bi-check-circle text-success"></i></a></td>
            ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusContrato('.$id.')"><i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
    echo'
        <td><a href="#" data-bs-toggle="modal" data-bs-target="#reporteContratoIndividual"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>