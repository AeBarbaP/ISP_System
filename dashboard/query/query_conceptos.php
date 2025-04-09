<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM conceptos ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value="" selected>Selecciona el concepto ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['concepto'].'</option>
    ';
}

?>