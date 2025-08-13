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
            $comunidad1 = $row['comunidad'];

            if ($comunidad1 == 0) {
                $comunidad = 'Sin comunidad';
            } else {
                $comunidad = $comunidad1;
            }
        
            echo'
                <option value="'.$folio.'">'.$nombre.' | '.$comunidad.'</option>
            ';
        }
    }
    
?>