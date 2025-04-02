<?php
    session_start();
    include('../prcd/qc/qc.php');
    // $usr = $_SESSION['usr'];
    $usr = 1;


$sql = "SELECT * FROM log_registro WHERE tipo_dato = 39 AND usr = '$usr'";
$resultado = $conn->query($sql);
$fila = $resultado->num_rows;

$sqlExpedientes = "SELECT * FROM log_registro WHERE tipo_dato = 37 AND usr = '$usr'";
$resultadoExp = $conn->query($sqlExpedientes);
$filaExp = $resultadoExp->num_rows;

$sqlTarjetones = "SELECT * FROM log_registro WHERE tipo_dato = 38 AND usr = '$usr'";
$resultadoTar = $conn->query($sqlTarjetones);
$filaTar = $resultadoTar->num_rows;

$sqlActualizar = "SELECT * FROM log_registro WHERE tipo_dato = 40 AND usr = '$usr'";
$resultadoAct = $conn->query($sqlActualizar);
$filaAct = $resultadoAct->num_rows;


    echo json_encode(array(
        'filas'=>$fila,
        'filasExp'=>$filaExp,
        'filasTar'=>$filaTar,
        'filasAct'=>$filaAct
    ));

?>