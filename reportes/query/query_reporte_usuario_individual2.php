<?php
require('../prcd/conn.php');

$usuario = $_POST['usuario'];
$fechaInicio = $_POST['fechaInicio'];
$fechaFinal = $_POST['fechaFinal'];

$sql = "SELECT * FROM log_users WHERE 
username = '$usuario' AND 
(DATE(hora) BETWEEN '$fechaInicio' AND '$fechaFinal') 
ORDER BY id DESC";

$resultado = $conn->query($sql);
$x = 0;
$totalSuma = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    // $totalSuma = $totalSuma + $row['total'];
    $accion = $row['accion'];
    $user = $row['username'];
    $rowNombre = $conn->query("SELECT * FROM users WHERE username = '$usuario'")->fetch_assoc();

    $rowAccion = $conn->query("SELECT * FROM catalogo_logs WHERE id = '$accion'")->fetch_assoc();

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$rowNombre['nombre'].'</td>
        <td>'.$rowAccion['descripcion'].'</td>
        <td>'.$row['hora'].'</td>
        <td>Sin estatus</td>
    </tr>
    ';
}
echo'
<tr class="table-info">
    <td colspan="3" class="text-center"></td>
    <td colspan="1" class="text-center"><strong>Total:</strong></td>
    <td colspan="1" class="text-center">'.$totalSuma.'</td>
    <td colspan="1" class="text-end"></td>
</tr>
';
?>