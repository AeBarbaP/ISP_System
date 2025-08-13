<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_instalacion"; // Busca coincidencias parciales
$resultado = $conn->query($sql);

while ($row = $resultado->fetch_assoc()){
    echo '
    
        <li><a class="dropdown-item" href="#" onclick="agregarCostoInstalacion('.$row['id'].','.$row['costo'].')">'.$row['tipo_instalacion'].'</a></li>

    ';
}

?>