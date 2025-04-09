<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_paquetes ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['paquetes'].'</option>
    ';
}

?>