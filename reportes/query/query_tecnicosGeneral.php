<?php
    require('../../dashboard/prcd/conn.php');

    // $tecnico = $_POST['tecnico'];

    $sql = "SELECT * FROM tecnicos WHERE estatus = 1 ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    $y = 0;
    while($row = $resultado->fetch_assoc()){
        $fecha_creacion = $row['fecha_creacion'];
        $fecha_actualizacion = $row['fecha_actualizacion'];
        $nombre = $row['nombre'];
        $id = $row['id'];
        $estatus = $row['estatus'];

        
        $sqlFallas = "SELECT * FROM cortes WHERE tecnico = '$id'";
        $resultadoFallas = $conn->query($sqlFallas);
        while($rowFallas = $resultadoFallas->fetch_assoc()){
            $x++;
            $folio = $rowFallas['folio_cliente'];
            
            $rowNombre = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();

            if ($rowNombre['nombre'] && (is_null($rowNombre['nombre']) || $rowNombre['nombre'] == "")) {
                $nombre = "Sin datos";
            } else if ($nombre) {
                    $nombre = $rowNombre['nombre'];
            } else {
                    $nombre = "Sin datos";
            }

            echo'
                <tr>
                    <td>'.$x.'</td>
                    <td>Cortes de servicio</td>
                    <td>'.$nombre.'</td>
                    <td>'.$rowFallas['fecha'].'</td>
                    
            ';

        if($rowFallas['estatus'] == 1){
        echo'
        <td><a href="#" onclick="cambiaEstatusCorte('.$id.')">Activo <i class="bi bi-check-circle text-success"></i></a></td>
        ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusCorte('.$id.')">Inactivo <i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }

        }
        $sqlCortes = "SELECT * FROM incidencias WHERE tecnico = '$id'";
        $resultadoCortes = $conn->query($sqlCortes);
        while($rowCortes = $resultadoCortes->fetch_assoc()){
            $x++;
            $folio2 = $rowCortes['folio_cliente'];

            $rowNombre2 = $conn->query("SELECT * FROM clientes WHERE folio = '$folio2'")->fetch_assoc();

            $nombre2 = $rowNombre2['nombre'];

            echo'
                <tr>
                    <td>'.$x.'</td>
                    <td>Incidencias de servicio</td>
                    <td>'.$nombre2.'</td>
                    <td>'.$rowCortes['fecha_reporte'].'</td>
                    
            ';

        if($rowCortes['estatus'] == 1){
        echo'
        <td><a href="#" onclick="cambiaEstatusFalla'.$id.')">Activo <i class="bi bi-check-circle text-success" </i></a></td>
        ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusFalla('.$id.')">Inactivo <i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
        }

        
    echo'
        <!--<td><a href="#" data-bs-toggle="modal" data-bs-target="#reporteIndividualTecnico"  onclick="consultaTecnicosRep('.$id.')"><i class="bi bi-pen"></i></a></td> 
        Esta función no existe aún, es para llenar los campos del modal que genera reporte global o detallado de actividades de usuarios, hay que incluir login y logout además de los logs de usr-->
    </tr>
    ';
    }

?>