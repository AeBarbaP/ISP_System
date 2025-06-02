<?php
session_start();

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $userLog = $_SESSION['username'];
    $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

    include('conn.php');

    $nombre = $_POST['nombre'];
    $municipio = $_POST['municipio'];

    $sqlinsertUsr= "INSERT INTO catalogo_comunidades(
        comunidad,
        municipio
        )VALUES(
        '$nombre',
        '$municipio'
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
        27,
        $fechaHoy,
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