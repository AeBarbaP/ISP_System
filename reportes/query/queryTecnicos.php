<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM tecnicos ORDER BY id DESC"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['fecha_creacion'].'</td>
        <td>'.$row['nombre'].'</td>
        ';
        if($estatus == 1){
            echo'
            <td><a href="#" onclick="cambioEstatus(0, '.$row['id'].')"><i class="bi bi-check-circle text-success"></i></a></td>
            ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambioEstatus(1, '.$row['id'].')"><i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
        echo'
            <td><a href="#" onclick="editarTecnico('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>