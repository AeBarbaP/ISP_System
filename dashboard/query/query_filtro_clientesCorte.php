<?php
require('../prcd/conn.php');

$nombre = $_POST['texto'];
if ($nombre == ""){
    echo '<option value="" >Escribe en el filtro para buscar el cliente ...</option>';
}
else{

    $sql = "SELECT * FROM clientes WHERE nombre LIKE '%$nombre%'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $clientes = array();
    echo '<option value="" >Selecciona...</option>';
    while($row = $resultado->fetch_assoc()){
        $comunidad = $row['comunidad'];


        echo '<option value="'.$row['folio'].'" data-name="'.$row['nombre'].'">'.$row['nombre'].' | '.$comunidad.'</option>';
    }
}

?>