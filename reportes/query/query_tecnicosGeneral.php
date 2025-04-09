<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM tecnicos ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $fecha_creacion = $row['fecha_creacion'];
        $fecha_actualizacion = $row['fecha_actualizacion'];
        $nombre = $row['nombre'];
        $id = $row['id'];
        $estatus = $row['estatus'];

        echo'
            <tr>
                <td>'.$x.'</td>
                <td>'.$nombre.'</td>
                <td>'.$fecha_creacion.'</td>
                <td>'.$fecha_actualizacion.'</td>
                
        ';
        if($estatus == 1){
            echo'
            <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')"><i class="bi bi-check-circle text-success"></i></a></td>
            ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')"><i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
    echo'
        <td><a href="#" data-bs-toggle="modal" data-bs-target="#reporteIndividualUsr" onclick="consultaTecnicosInfoRep('.$id.')"><i class="bi bi-pen"></i></a></td> //Esta función no existe aún, es para llenar los campos del modal que genera reporte global o detallado de actividades de usuarios, hay que incluir login y logout además de los logs de usr
    </tr>
    ';
    }

?>