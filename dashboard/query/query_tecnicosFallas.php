<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM tecnicos WHERE estatus = 1 ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    echo'
        <option value="" selected>Selecciona Técnico...</option>
    ';
    while($row = $resultado->fetch_assoc()){
        $x++;
        $nombre = $row['nombre'];
        $id = $row['id'];
    
        echo'
            <option value="'.$id.'">'.$nombre.'</option>
        ';
    }
    
?>