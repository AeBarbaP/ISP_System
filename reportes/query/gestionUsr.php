<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM users ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $id = $row['id'];
    $tipoUser = $row['tipo_usr'];
    $estatus = $row['estatus'];
    $fechaRegistro = $row['fecha_creacion'];
    $color = $row['color'];

    $sqlLogin = "SELECT * FROM logs_login WHERE id_ext = '$id' ORDER BY id DESC LIMIT 1";
    $resultadoLogin = $conn->query($sqlLogin);
    $rowLogin = $resultadoLogin->fetch_assoc();

    if($rowLogin['inicio'] == "" || IS_NULL($rowLogin['inicio'])){ 
        $acceso = $rowLogin['fin'];
    } else {
        $acceso = $rowLogin['inicio'];
    }

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
        <td>'.$acceso.'</td>';
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
        <td> <p><i class="bi bi-circle-fill" style="color: '.$color.'"></i></p></td>
        <td><a type="button" style="decoration:none;" onclick="editarUsuario('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>