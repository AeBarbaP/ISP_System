<?php
require('../prcd/conn.php');

$sql2 = "SELECT * FROM cortes";
$resultado2 = $conn->query($sql2);

echo '<option value="" >Selecciona...</option>';
while($row2 = $resultado2->fetch_assoc()){

    $folio_corte = $row2['folio_corte'];
    $folio_cliente = $row2['folio_cliente'];

    $sql = "SELECT * FROM clientes WHERE folio = '$folio_cliente'"; // Busca coincidencias parciales
    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();

    $comunidad = $row['comunidad'];

    $sql1 = "SELECT * FROM catalogo_comunidades WHERE id = '$comunidad'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();

    $comunidad1 = $row1['comunidad'];

    echo '<option value="'.$folio_corte.'" data-name="'.$row['nombre'].'" data-corte="'.$folio_corte.'">'.$row['nombre'].' | '.$comunidad1.'</option>';

}

?>