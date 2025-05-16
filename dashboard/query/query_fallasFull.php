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
        $tecnico = $row['tecnico'];
        $fecha_reporte = $row['fecha_reporte'];

        while($row = $resultado->fetch_assoc()){
            $x++;
            $estatus = $row['estatus'];
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
                    <td><i class="bi bi-check-circle text-success"></i></td>
                    ';
                }
                else{
                    echo'
                    <td><i class="bi bi-x-circle-fill text-danger"></i></td>
                    ';
                }
            echo'
                
                <td><a href="#" onclick="editarFalla1('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
            </tr>
            ';
        }
    }
    
?>