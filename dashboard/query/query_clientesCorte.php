<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM clientes"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();
echo '<option selected>Selecciona...</option>';
while($row = $resultado->fetch_assoc()){
    $comunidad = $row['comunidad'];

    $sql1 = "SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $comunidad1 = $row1['comunidad'];

    echo '<option value="'.$row['folio'].'" data-username="'.$row['nombre'].'" data-username="'.$row['nombre'].'">'.$row['nombre'].' | '.$comunidad1.'</option>';
}

?>