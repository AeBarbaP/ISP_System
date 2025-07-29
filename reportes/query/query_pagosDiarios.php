<?php
require('../../dashboard/prcd/conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fecha = $_POST['fecha'];

$x = 0;

$sql = "SELECT * FROM pagos_generales WHERE DATE(fecha_pago) = '$fecha'";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $x++;
    $idUsr = $row['id_ext'];
    $folio = $row['folio_pago'];

    $rowUser = $conn->query("SELECT * FROM users WHERE username = '$idUsr'")->fetch_assoc();

    $user = $rowUser['username'];
    $nombre = $rowUser['nombre'];

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$folio.'</td>
        <td>'.$nombre.'</td>
        <td><a href="#" onclick="eliminarPago(\''.$folio.'\')"><i class="bi bi-trash3"></i></a></td>
        <td><a href="prcd/reporte_corte_por_fecha.php?fecha='.$fecha.'&username='.$user.'" target="_blank"><i class="bi bi-eye-fill"></i></a></td>
    </tr>
    ';
}

?>