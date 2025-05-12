<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM clientes"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$clientes = array();
echo '<option selected>Selecciona...</option>';
while($row = $resultado->fetch_assoc()){
    echo '<option value="'.$row['id'].'" data-username="'.$row['nombre'].'">'.$row['nombre'].'</option>';
}

?>