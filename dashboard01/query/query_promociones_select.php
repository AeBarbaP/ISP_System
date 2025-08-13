<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM promociones WHERE estatus = 1 ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
echo '
    <option value="" selected>Selecciona...</option>
';
while($row = $resultado->fetch_assoc()){
    
    echo '<option value="' . $row['id'] . '" data-categoria="6" data-costo="-'.$row['descuento'].'" data-concepto="Descuento" data-periodo="Descuento">' . $row['promo'] . ' | -$' . $row['descuento'] . '</option>';
    
}

?>