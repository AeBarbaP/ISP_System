<?php
session_start();
require('../prcd/conn.php');

$id = $_SESSION['idUsr'];

$sql = "SELECT * FROM users WHERE id = '$id'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

if($resultado){
    $row = $resultado->fetch_assoc();

    echo json_encode(array(
        'success' => 1,
        'id' => $row['id'],
        'username' => $row['username'],
        'nombre' => $row['nombre'],
        'pwd' => $row['pwd'],
        'tipo_usr' => $row['tipo_usr'],
        'estatus' => $row['estatus']
    ));
}
else{
    $error = $conn->error;
    echo json_encode(array(
        'success'=>0,
        'error'=>$error
    ));
}

?>