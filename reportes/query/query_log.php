<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM log_users ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $accion = $row['accion'];
    $sqlAccion = "SELECT * FROM catalogo_logs WHERE id = '$accion'";
    $resultadoAccion = $conn->query($sqlAccion);
    $rowAccion = $resultadoAccion->fetch_assoc();
    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['username'].'</td>
        <td>'.$rowAccion['descripcion'].'</td>
        <td>'.$row['hora'].'</td>
    </tr>
    ';
}

?>