<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_comunidades ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value="" selected>Selecciona la comunidad ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['comunidad'].'</option>
    ';
}

?>