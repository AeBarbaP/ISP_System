<?php

require_once("../prcd/conn.php");

$id = $_POST['id'];

$sql = "SELECT * FROM log_users WHERE username = '$id' AND accion = 21 ORDER BY id DESC LIMIT 1";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$acceso = $row['hora'];

echo json_encode(array(
    'success'=>1,
    'hora'=>$acceso
))

?>