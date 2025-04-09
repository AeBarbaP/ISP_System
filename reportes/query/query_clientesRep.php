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
    
        echo'
            <option>'.$nombre.' | '.$folio.'</option>
        ';
    }
    
?>