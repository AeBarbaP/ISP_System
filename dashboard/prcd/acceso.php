<?php
session_start();

require('conn.php');

$usr = $_POST['usr'];
$pwd = $_POST['pwd'];

$query = "SELECT * FROM users WHERE username = '$usr' AND pwd = '$pwd'";
$resultado = $conn->query($query);
$filas = $resultado->num_rows;

if($filas == 1){ 
    $_SESSION['sess'] = 1;
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    $_SESSION['sess'] = "";
    echo json_encode(array(
        'success'=>0
    ));
}