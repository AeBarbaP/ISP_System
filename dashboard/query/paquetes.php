<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_paquetes ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value="">Selecciona el paquete ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo'
   <option value="' . $row['id'] . '" data-costo="'. $row['costo'] . '">' . $row['paquetes'] . ' - <span>' . $row['costo'] . '</span></option>
    ';
}

?>