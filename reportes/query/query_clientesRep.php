<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM clientes ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $nombre = $row['nombre'];
        $folio = $row['folio'];
        $servicio = $row['servicio'];
        $id = $row['id'];
        $comunidad = $row['comunidad'];

        /* $sql1 = "SELECT * FROM catalogo_comunidades WHERE id = '$comunidad1'";
        $resultado1 = $conn->query($sql1);
        $row1 = $resultado1->fetch_assoc(); */

        /* $comunidad = $row['comunidad']; */
    
        echo'
            <option value="'.$folio.'">'.$nombre.' | '.$comunidad.'</option>
        ';
    }
    
?>