<?php
    session_start();
    /* $usr = $_SESSION['usr']; */
    $usr = "annaeliza";

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');

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
        $sqlInsertUsr = "INSERT INTO log_registro(
            usr,
            tipo_dato,
            fecha)
            VALUES(
            '$usr',
            '$tipo_dato',
            '$fecha_registro')";
        $resultadoUsr = $conn->query($sqlInsertUsr);
        echo json_encode(array(
            'success' => 1
        ));
    }
    else{
        echo json_encode(array(
            'error' => 0
        ));
    }
    

?>