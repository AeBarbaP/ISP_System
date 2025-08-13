<?php
    session_start();
    include ("qc/qc.php");

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $userLog = $_SESSION['username'];
    $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");


    $estatus = $_POST['estatus'];
    $id = $_POST['id'];

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

    $sqlUpdateUsers ="UPDATE users SET estatus = '$estatus' WHERE id = '$id'";
    $resultadoUpdateUsers = $conn->query($sqlUpdateUsers);

    if($resultadoUpdateUsers){
         // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        24,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
    }

?>