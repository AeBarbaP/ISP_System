<?php

    //$fecha_registro = strftime("%Y-%m-%d,%H:%M:%S");

    include('conn.php');

    $nombre = $_POST['nombre'];
    $estado = $_POST['estado'];

    $sqlinsertUsr= "INSERT INTO catalogo_municipio(
        municipio,
        estado
        )VALUES(
        '$nombre',
        '$estado'
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