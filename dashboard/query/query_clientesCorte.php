<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM clientes"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();
echo '<option value="" >Selecciona...</option>';
while($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];


    echo '<option value="'.$row['folio'].'" data-name="'.$row['nombre'].'">'.$row['nombre'].' | '.$comunidad.'</option>';
}

?>