<?php
require('conn.php');

$folio = $_POST['folio'];
$estatus = $_POST['estatus'];

if($estatus == 1){
    $estatusC = 0;
}
else{
    $estatusC = 1;
}

$sql = "UPDATE clientes SET
    estatus = '$estatusC'
    WHERE
    folio = '$folio'
";
$resultado = $conn->query($sql);

if($resultado){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    echo json_encode(array(
        'success'=>0
    ));
}