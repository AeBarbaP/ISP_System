<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_paquetes ORDER BY id DESC"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['paquetes'].'</td>
        <td>'.$row['velocidad'].'</td>
        <td>'.$row['costo'].'</td>';
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
        
        <td><a href="#" onclick="editarPaquete('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>