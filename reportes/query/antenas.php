<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM antenas WHERE estatus = 1 ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value="" selected>Selecciona la antena ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['marca'].' '.$row['modelo'].' | '.$row['MAC'].'</option>
    ';
}

?>