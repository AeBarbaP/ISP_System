<?php
require('../prcd/conn.php');
$cliente = $_POST['cliente'];
$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$cliente%'"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();

while($row = $resultado->fetch_assoc()){
    $clientes[] = array(
        'nombre' => $row['nombre'],
        'folio' => $row['folio'] // Asegúrate de incluir el folio
    );
}

echo json_encode($clientes);
?>