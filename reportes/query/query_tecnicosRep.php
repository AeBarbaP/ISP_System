<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM tecnicos ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $nombre = $row['nombre'];
        $tipo_usr = $row['tipo_usr'];
        $id = $row['id'];
        $estatus = $row['estatus'];
        echo'
            <option value="'.$id.'">'.$nombre.'</option>
        ';
    }

?>