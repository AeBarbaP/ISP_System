<?php
/* require('../../dashboard/prcd/conn.php');

$sql = "SELECT COUNT(*) AS cortes FROM cortes WHERE MONTH(fecha) = MONTH(CURRENT_DATE()) AND YEAR(fecha) = YEAR(CURRENT_DATE())";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$cortes = $row['cortes'];

if ($cortes == 0 || $cortes == null) {
    $cortes = 0;
}
else{
    $cortes = $cortes;
}

echo json_encode(array(
    'success'=>1,
    'cortes'=>$cortes
)); */

require_once("../prcd/conn.php");
    $x = 0;

    $hoy = new DateTime();
    $hoy->setTime(0, 0, 0);

    $diaHoy = $hoy->format('d');
    $mesHoy = $hoy->format('m');
    $anioHoy = $hoy->format('Y');

    $sql_clientes = "SELECT * FROM clientes";
    $resultado_clientes = $conn->query($sql_clientes);

    while ($cliente = $resultado_clientes->fetch_assoc()) {
        $fecha_corte = new DateTime($cliente['fecha_corte']);
        $fecha_corte->setTime(0, 0, 0); // Normalizar

        $folio = $cliente['folio'];
        $diaCorte = $fecha_corte->format('d');
        $mesCorte = $fecha_corte->format('m');
        $anioCorte = $fecha_corte->format('Y');

        // Evita sobreescribir el resultado de clientes
        $sqlCortes = "SELECT * FROM clientes WHERE estatus = 3 OR estatus = 2";
;

        $resultado_Cortes = $conn->query($sqlCortes);
        $filas = $resultado_Cortes->num_rows;

        
        $x++;
        
    }

    echo json_encode(array(
        'success' => 1,
        'cortes' => $filas
    ));

?>