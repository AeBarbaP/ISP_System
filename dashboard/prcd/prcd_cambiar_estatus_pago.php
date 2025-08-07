<?php
require('conn.php');

$id = $_POST['id'];
$estatus = $_POST['estatus'];

if($estatus == 0){
    $estatusC = 0;
}
else if ($estatus == 1){
    $estatusC = 1;
}


$sql = "UPDATE pagos_generales SET
    estatus = '$estatusC'
    WHERE
    id = '$id'
";
$resultado = $conn->query($sql);

if($resultado){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    echo json_encode(array(
        'success'=>0,
        'error' => $conn->error
    ));
}