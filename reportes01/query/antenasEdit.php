<?php

require('../prcd/conn.php');

$id = $_POST['id'];

$sql = "SELECT * FROM antenas WHERE estatus = 0 ORDER BY id ASC";
$resultado = $conn->query($sql);
$sql2 = "SELECT * FROM antenas WHERE id = '$id'";
$resultado2 = $conn->query($sql2);
$row2 = $resultado2->fetch_assoc();

echo'
<option value="'.$row2['id'].'" selected>'.$row2['marca'].' '.$row2['modelo'].' | '.$row2['MAC'].'</option>
';

while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['id'].'">'.$row['marca'].' '.$row['modelo'].' | '.$row['MAC'].'</option>
    ';
}

?>