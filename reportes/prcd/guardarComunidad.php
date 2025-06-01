<?php

    //$fecha_registro = strftime("%Y-%m-%d,%H:%M:%S");

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
    }
    else{
        echo json_encode(array(
            'error' => 0
        ));
    }
    

?>