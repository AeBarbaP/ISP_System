<?php
    require('../../dashboard/prcd/conn.php');

    $tecnico = $_POST['tecnico'];

    $sql = "SELECT * FROM tecnicos WHERE id = '$tecnico' AND estatus = 1 ORDER BY id DESC";
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
            echo'
                <tr>
                    <td>'.$x.'</td>
                    <td>Cortes de servicio</td>
                    <td>'.$rowNombre['nombre'].'</td>
                    <td>'.$rowFallas['fecha'].'</td>
                    
            ';

        if($rowFallas['estatus'] == 1){
        echo'
        <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')">Activo <i class="bi bi-check-circle text-success"></i></a></td>
        ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')">Inactivo<i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }

        }
        $sqlCortes = "SELECT * FROM incidencias WHERE tecnico = '$id'";
        $resultadoCortes = $conn->query($sqlCortes);
        while($rowCortes = $resultadoCortes->fetch_assoc()){
            $x++;
            echo'
                <tr>
                    <td>'.$x.'</td>
                    <td>Incidencias de servicio</td>
                    <td>'.$rowCortes['folio_cliente'].'</td>
                    <td>'.$rowCortes['fecha_reporte'].'</td>
                    
            ';

        if($rowCortes['estatus'] == 1){
        echo'
        <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')">Activo <i class="bi bi-check-circle text-success"></i></a></td>
        ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusTecnicoRep('.$id.')">Inactivo <i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
        }

        
    
    }

?>