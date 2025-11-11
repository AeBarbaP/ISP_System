<?php
    session_start();
    require('conn.php');

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");
    //$userLog = $_SESSION['username'];
    $userLog = $_POST['username'];
    
    // $id = $_SESSION['idUsr'];
    $id = $_POST['id'];

    $estatus = 1;

    $query = "INSERT INTO corte_caja (
        usr,
        fecha,
        estatus
    ) VALUES (
        '$id',
        '$fechaHoy',
        '$estatus'
    )
    ";

    $resultado = $conn->query($query);

    if($resultado){
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        4,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
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