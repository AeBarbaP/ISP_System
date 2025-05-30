<?php
require('../prcd/conn.php');
$id = $_POST['id'];

$sql = "SELECT * FROM antenas WHERE id = '$id'";
$resultado = $conn->query($sql);

    if($resultado){
        $row = $resultado->fetch_assoc();
        echo json_encode(
            array(
            'success'=> 1,
            'marca' => $row['marca'],
            'modelo' => $row['modelo'],
            'num_serie' => $row['num_serie'],
            'mac' => $row['MAC'],
            'fecha_alta' => $row['fecha_alta'],
            'estatus' => $row['estatus'],
            'ipaddress' => $row['ip_address'],
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