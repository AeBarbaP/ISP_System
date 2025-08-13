<?php
require('../prcd/conn.php');
$id = $_POST['id'];

$sql = "SELECT * FROM catalogo_comunidades WHERE id = '$id'";
$resultado = $conn->query($sql);

    if($resultado){
        $row = $resultado->fetch_assoc();
        echo json_encode(
            array(
            'success'=> 1,
            'comunidad' => $row['comunidad'],
            'municipio' => $row['municipio'],
            'estado' => $row['estado']
            )
        );
    }
    else{
        echo json_encode(
            array(
                'success'=>0
            )
        );
    }
?>