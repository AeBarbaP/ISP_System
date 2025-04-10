<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM antenas ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['marca'].'</td>
        <td>'.$row['modelo'].'</td>
        <td>'.$row['num_serie'].'</td>
        <td>'.$row['MAC'].'</td>
        <td>'.$row['fecha_alta'].'</td>';
        if($estatus == 1){
            echo'
            <td><i class="bi bi-check-circle text-success"></i></td>
            ';
        }
        else{
            echo'
            <td><i class="bi bi-x-circle-fill text-danger"></i></td>
            ';
        }
    echo'
        
        <td><a href="#" onclick="editarAntena('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>