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
    $row = $resultado->fetch_assoc();

    $id = $row['id'];
    
    $_SESSION['username'] = $row['username'];
    $_SESSION['nombre'] = $row['nombre'];
    $_SESSION['estatusCorte'] = $revisarCorte($id);

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

function revisarCorte($id){

    $sqlCorte = "SELECT * FROM cortes WHERE usr ='$id'";
    $resultadoCorte = $conn->query($sqlCorte);
    $filas = $resultadoCorte->num_rows;

    if($filas == 1){
        $rowCorte = $resultadoCorte->fetch_assoc();
        $corte = $rowCorte['estatus']; //esta variable confirma si está cortado el servicio o no
        return $corte;
    }
    else{
        $corte = 0;
        return $corte;

    }

}