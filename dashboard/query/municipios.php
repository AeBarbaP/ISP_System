<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_municipio ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value="" selected>Selecciona el municipio ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['municipio'].'</option>
    ';
}

?>