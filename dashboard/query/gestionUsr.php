<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM users ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $tipoUser = $row['tipo_usr'];
    $estatus = $row['estatus'];
    echo'
    <tr class="text-center">
        <td></td>';
        if($tipoUser == 1){
            echo'
            <td>Administrador</td>
            ';
        }
        else if($tipoUser == 2){
            echo'
            <td>Usuario B</td>
            ';
        }
        if($tipoUser == 3){
            echo'
            <td>Usuario A</td>
            ';
        }
    echo'
        <td>'.$row['fecha_creacion'].'</td>
        <td>Último login</td>';
        if($estatus == 0){
            echo'
            <td>Inactivo</td>
            ';
        }
        else if($estatus == 1){
            echo'
            <td>Activo</td>
            ';
        }
    echo'
        <td>'.$row['nombre'].'</td>
        <td>'.$row['username'].'</td>
        <td><a type="button" style="decoration:none;" onclick="editarUsuario()"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>