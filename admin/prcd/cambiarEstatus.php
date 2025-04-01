<?php

    session_start();
    include ("qc/qc.php");

    $estatus = $_POST['estatus'];
    $id = $_POST['id'];

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

    $sqlUpdateUsers ="UPDATE users SET estatus = '$estatus' WHERE id = '$id'";
    $resultadoUpdateUsers = $conn->query($sqlUpdateUsers);

?>