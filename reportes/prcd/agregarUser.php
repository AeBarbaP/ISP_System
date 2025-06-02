<?php
    session_start();

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $userLog = $_SESSION['username'];
    $fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

    $fecha_registro = strftime("%Y-%m-%d,%H:%M:%S");

    include('qc/qc.php');

    $nombre = $_POST['nombre'];
    $username = $_POST['username'];
    $pwd = $_POST['pwd'];
    $perfil = $_POST['perfil'];
    $color = $_POST['color'];
    $estatus = 1; 
    $tipo_dato = 9;


    $sqlinsertUsr= "INSERT INTO users(username,pwd,perfil,nombre,fecha_creacion,estatus,color) VALUES('$username','$pwd','$perfil','$nombre','$fecha_registro','$estatus','$color')";
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
        23,
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