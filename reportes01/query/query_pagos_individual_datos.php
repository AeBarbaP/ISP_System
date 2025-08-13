<?php
require('../../dashboard/prcd/conn.php');

$cliente = $_POST['cliente'];

$row = $conn->query("SELECT * FROM clientes WHERE folio = '$cliente'")->fetch_assoc();

echo json_encode(
    array(
        'success'=>1,
        'nombre'=>$row['nombre'],
        'domicilio'=>$row['domicilio'],
        'folio'=>$row['folio']
    )
)

?>