<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM users ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $username = $row['username'];
        $nombre = $row['nombre'];
        $tipo_usr = $row['tipo_usr'];
        $id = $row['id'];
        $estatus = $row['estatus'];

        if ($tipo_usr == 1) {
            $tipousr = "Administrador";
        }
        else if ($tipo_usr == 2) {
            $tipousr = "Usuario A";
        }
        else if ($tipo_usr == 3) {
            $tipousr = "Usuario B";
        }
        else if ($tipo_usr == 0) {
            $tipousr = "Super Admin";
        }

        echo'
            <tr>
                <td>'.$x.'</td>
                <td>'.$nombre.'</td>
                <td>'.$username.'</td>
                <td>'.$tipousr.'</td>
                
        ';
        if($estatus == 1){
            echo'
            <td><a href="#" onclick="cambiaEstatusUsuarioRep('.$id.')"><i class="bi bi-check-circle text-success"></i></a></td>
            ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusUsuarioRep('.$id.')"><i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
    echo'
        <td><a href="#" data-bs-toggle="modal" data-bs-target="#reporteIndividualUsr" onclick="consultaUsuariosInfoRep('.$id.')"><i class="bi bi-pen"></i></a></td> //Esta función no existe aún, es para llenar los campos del modal que genera reporte global o detallado de actividades de usuarios, hay que incluir login y logout además de los logs de usr
    </tr>
    ';
    }

?>