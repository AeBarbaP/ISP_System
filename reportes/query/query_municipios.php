<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_municipio ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $estatus = $row['estatus'];
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['municipio'].'</td>
        <td>'.$row['estado'].'</td>
        <td><a href="#" onclick="editarMunicipio('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>