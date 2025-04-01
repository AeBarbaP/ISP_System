<?php
    session_start();
    include('../prcd/qc/qc.php');
    // $usr = $_SESSION['usr'];


$sql = "SELECT * FROM log_registro WHERE tipo_dato = 39";
$resultado = $conn->query($sql);
$fila = $resultado->num_rows;

$sqlExpedientes = "SELECT * FROM log_registro WHERE tipo_dato = 37";
$resultadoExp = $conn->query($sqlExpedientes);
$filaExp = $resultadoExp->num_rows;

$sqlTarjetones = "SELECT * FROM log_registro WHERE tipo_dato = 38";
$resultadoTar = $conn->query($sqlTarjetones);
$filaTar = $resultadoTar->num_rows;

$sqlActualizar = "SELECT * FROM log_registro WHERE tipo_dato = 40";
$resultadoAct = $conn->query($sqlActualizar);
$filaAct = $resultadoAct->num_rows;


    echo json_encode(array(
        'filas'=>$fila,
        'filasExp'=>$filaExp,
        'filasTar'=>$filaTar,
        'filasAct'=>$filaAct
    ));

?>