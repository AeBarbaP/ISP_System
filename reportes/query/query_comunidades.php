<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM catalogo_comunidades ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $mun = $row["municipio"];
    $sql1 = "SELECT * FROM catalogo_municipio WHERE id = '$mun'";
    $resultado1 = $conn->query($sql1);
    $row1 = $resultado1->fetch_assoc();
    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['comunidad'].'</td>
        <td>'.$row1['municipio'].'</td>
        <td>'.$row['estado'].'</td>
        <td><a href="#" onclick="editarComunidad('.$row['id'].')"><i class="bi bi-pencil-square"></i></a></td>
        <td><a href="#" onclick="eliminarComunidad('.$row['id'].')"><i class="bi bi-trash"></i></a></td>
    </tr>
    ';
}

?>