<?php
require('../../dashboard/prcd/conn.php');

$fecha = $_POST['fecha'];
$x = 0;

$sql = "SELECT * FROM corte_caja WHERE DATE(fecha) = '$fecha'";
$resultado = $conn->query($sql);
while ($row = $resultado->fetch_assoc()){
    $x++;
    $idUsr = $row['usr'];

    $rowUser = $conn->query("SELECT * FROM users WHERE id = '$idUsr'")->fetch_assoc();

    $user = $rowUser['username'];
    $nombre = $rowUser['nombre'];

    // $rowPagosGenerales = $conn->query("SELECT * FROM pagos_generales WHERE id_ext = '$user'")->fetch_assoc();

    // $pagos = $rowPagosGenerales['total'];
    
    // while($rowOtrosGastos = $conn->query("SELECT * FROM otros_gastos WHERE id_ext = '$user'")->fetch_assoc()){
    //     $total = $rowOtrosGastos['cantidad'];
    //     $gastoTotal = $gastoTotal + $total;
    // }

    // $total = $pagos - $gastoTotal;

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$nombre.'</td>
        <td><a href="prcd/reporte_corte_por_fecha.php?fecha='.$fecha.'&username='.$user.'" target="_blank"><i class="bi bi-eye-fill"></i></a></td>
    </tr>
    ';
}

?>