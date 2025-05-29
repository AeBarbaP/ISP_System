<?php
session_start();

require('conn.php');

$username = $_SESSION['username'];
$folio = $_POST['folio'];
$fecha_corte = $_POST['fecha_corte'];

$query = "UPDATE cortes SET
    username = '$username',
    fecha = '$fecha_corte'
    WHERE folio_corte = '$folio'
";

$resultado = $conn->query($query);

if($resultado){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    $error = $conn->error;
    echo json_encode(array(
        'success'=>0,
        'error' => $error
    ));
}

?>