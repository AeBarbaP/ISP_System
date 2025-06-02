<?php
session_start();
require_once ('conn.php');

$username = $_SESSION['username'];

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$fecha = $_POST['fecha'];
$folio = $_POST['folio'];
$descripcion = $_POST['descripcion'];
$tecnico = $_POST['tecnico'];
$fechaAsignacion = $_POST['fechaAsignacion'];
$idCliente = $_POST['idCliente'];

$sql = "INSERT INTO incidencias (
    fecha_reporte,
    folio_incidencia,
    descripcion,
    username,
    tecnico,
    folio_cliente,
    estatus
) VALUES (
    '$fecha',
    '$folio',
    '$descripcion',
    '$username',
    '$tecnico',
    '$idCliente',
    1
)";
$result = mysqli_query($conn, $sql);

if($result) {
    echo json_encode(array("success" => 1));
    // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        19,
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