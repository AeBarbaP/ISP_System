<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_instalacion ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['tipo_instalacion'].'</option>
    ';
}

?>