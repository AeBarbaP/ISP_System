<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM incidencias WHERE estatus = 1 ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;

        $folio = $row['folio_incidencia'];
        $descripcion = $row['descripcion'];
        $folio_cliente = $row['folio_cliente'];
        $tecnico = $row['tecnico'];
        $fecha_reporte = $row['fecha_reporte'];

        $sql1 = "SELECT * FROM tecnicos WHERE id = '$tecnico'";
        $resultado1 = $conn->query($sql1);
        $row1 = $resultado1->fetch_assoc();

        $nombreTecnico = $row1['nombre'];
        $id = $row1['id'];
    
        $sql2 = "SELECT * FROM clientes WHERE folio = '$folio_cliente'";
        $resultado2 = $conn->query($sql2);
        $row2 = $resultado2->fetch_assoc();

        $nombre = $row2['nombre'];
        $comunidad = $row2['comunidad'];

        echo'
            <option value="'.$folio.'">'.$nombre.' | '.$comunidad.'</option>
        ';
    }
    
?>