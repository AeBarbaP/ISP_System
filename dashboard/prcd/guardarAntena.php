<?php
    session_start();

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    // $userLog = $_SESSION['username'];
    $userLog =  $_POST['username'];
    $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");
    
    $fecha_registro = strftime("%Y-%m-%d,%H:%M:%S");

    include('conn.php');

    $fecha_alta = $_POST['fecha_alta'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $serie = $_POST['serie'];
    $mac = $_POST['mac'];
    $estatus = 1; 

    $sqlinsertUsr= "INSERT INTO antenas(
    marca,
    modelo,
    num_serie,
    MAC,
    fecha_alta,
    estatus
    )VALUES(
    '$marca',
    '$modelo',
    '$serie',
    '$mac',
    '$fecha_alta',
    '$estatus'
     )";
    $resultadoUsr= $conn->query($sqlinsertUsr);
    
    if($resultadoUsr){
        echo json_encode(array(
            'success' => 1
        ));
        // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        26,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
    }
    else{
        echo json_encode(array(
            'error' => 0
        ));
    }
    

?>