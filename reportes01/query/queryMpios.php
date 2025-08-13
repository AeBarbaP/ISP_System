<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_municipio ORDER BY id DESC"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$x = 0;
echo'
    <option value="" selected>Selecciona Municipio...</option>
';
while($row = $resultado->fetch_assoc()){
    $x++;
    echo'
        <option value="'.$row["id"].'">'.$row["municipio"].'</option>
    ';
}

?>