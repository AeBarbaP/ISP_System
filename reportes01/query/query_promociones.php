<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM promociones ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['promo'].'</td>
        <td>'.$row['tipo'].'</td>
        <td>'.$row['descuento'].'</td>
        <td>'.$row['fecha_inicio'].'</td>
        <td>'.$row['fecha_fin'].'</td>';
        if($estatus == 1){
            echo'
            <td>Activo <i class="bi bi-check-circle text-success"></i></td>
            ';
        }
        else{
            echo'
            <td>Inactivo <i class="bi bi-x-circle-fill text-danger"></i></td>
            ';
        }
    echo'
        
        <td><a href="#" onclick="editarPromo('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
        <td><a href="#" onclick="eliminarPromo('.$row['id'].')"><i class="bi bi-trash3 text-danger"></i></a></td>
    </tr>
    ';
}

?>