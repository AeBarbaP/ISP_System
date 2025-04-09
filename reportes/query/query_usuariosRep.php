<?php
    require('../../dashboard/prcd/conn.php');

    $sql = "SELECT * FROM users ORDER BY id DESC";
    $resultado = $conn->query($sql);
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $username = $row['username'];
        $nombre = $row['nombre'];
        $tipo_usr = $row['tipo_usr'];
        $id = $row['id'];
        $estatus = $row['estatus'];

        if($estatus == 1){
            echo'
                <option value="'.$username.'">'.$nombre.' | '.$username.'</option>
            ';
        }
    }

?>