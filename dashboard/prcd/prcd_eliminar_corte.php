<?php

require('conn.php');

$id = $_POST['id'];

$query = "DELETE FROM cortes WHERE id = '$id'";
$resultado = $conn->query($query);

    if($resultado){
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