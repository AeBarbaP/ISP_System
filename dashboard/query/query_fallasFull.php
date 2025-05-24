<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM incidencias ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;

        $folio = $row['folio_incidencia'];
        $descripcion = $row['descripcion'];
        $folio_cliente = $row['folio_cliente'];
        $tecnico1 = $row['tecnico'];
        $fecha_reporte = $row['fecha_reporte'];
        $estatus = $row['estatus'];
        $id = $row['id'];

        $sql1 = "SELECT * FROM tecnicos WHERE id = '$tecnico1'";
        $resultado1 = $conn->query($sql1);
        $row1 = $resultado1->fetch_assoc();

        $tecnico = $row1['nombre'];

        echo'
        <tr>
            <td>'.$x.'</td>
            <td>'.$folio.'</td>
            <td>'.$fecha_reporte.'</td>
            <td>'.$folio_cliente.'</td>
            <td>'.$tecnico.'</td>
            ';
            if($estatus == 1){
                echo'
                <td><a href="#" onclick="modalActualizarEstatusFalla('.$id.')"><i class="bi bi-record-circle-fill text-primary"></i></a></td>
                ';
            }
            else if ($estatus == 2){
                echo'
                <td><a href="#" onclick="modalActualizarEstatusFalla('.$id.')"><i class="bi bi-check-circle text-success"></i></a></td>
                ';
            }
            else if ($estatus == 0){
                echo'
                <td><a href="#" onclick="modalActualizarEstatusFalla('.$id.')"><i class="bi bi-x-circle text-danger"></i></a></td>
                ';
            }
        echo'
            
            <td><a href="#" onclick="editarIncidencia(\''.$folio.'\')"><i class="bi bi-pencil-square"></i></a></td>
        </tr>
        ';
    
    }
    
?>