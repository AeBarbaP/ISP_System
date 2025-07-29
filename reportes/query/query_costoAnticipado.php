<?php
    require('../prcd/conn.php');

    $cliente = $_POST['id'];

    $sql = "SELECT cuota FROM clientes WHERE folio = '$cliente'"; 
    $resultado = $conn->query($sql);

    $row = $resultado->fetch_assoc();

    echo json_encode($array(
        'cuota' => $row['cuota'];
    ));
?>