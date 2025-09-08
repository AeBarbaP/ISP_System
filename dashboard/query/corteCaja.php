<?php
session_start();
require('../prcd/conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fechaHoy = date('Y-m-d'); // Formato: 2023-05-20

// $id = $_SESSION['idUsr'];
$id = $_POST['id'];

$sql = "SELECT * FROM corte_caja WHERE usr = '$id' AND estatus = 1 AND DATE(fecha) = '$fechaHoy'";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;
if($filas == 1){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    echo json_encode(array(
        'success'=>0
    ));
}

?>
