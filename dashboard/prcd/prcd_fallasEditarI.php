<?php
session_start();
require_once ('conn.php');

$username = $_SESSION['username'];

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$folio = $_POST['folio'];
$estatus = $_POST['estatus'];

$sql = "UPDATE incidencias SET 
        estatus = '$estatus'    
        WHERE folio_incidencia = '$folio'";

$result = mysqli_query($conn, $sql);

if($result) {
    echo json_encode(array(
        "success" => 1,
    ));
    // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        18,
        $fechaHoy,
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------
} else {
    $error = $conn->error;
    echo json_encode(array("success" => 0, "error" => $error
));
}
mysqli_close($conn);

?>