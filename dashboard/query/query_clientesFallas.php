<?php
    require('../../dashboard/prcd/conn.php');

    $id = $_POST['texto'];

    if ($id == ""){ 
        echo '<option value="" >Escribe en el filtro para buscar el cliente ...</option>';
    }
    else{

        $sql = "SELECT * FROM clientes WHERE nombre LIKE '%$id%'";
        $resultado = $conn->query($sql);
        $x = 0;
        while($row = $resultado->fetch_assoc()){
            $x++;
            $nombre = $row['nombre'];
            $folio = $row['folio'];
            $servicio = $row['servicio'];
            $id = $row['id'];
            $comunidad = $row['comunidad'];

        
            echo'
                <option value="'.$folio.'">'.$nombre.' | '.$comunidad.'</option>
            ';
        }
    }
    
?>