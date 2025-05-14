<?php

require_once ('conn.php');

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
    tecnico,
    folio_cliente
) VALUES (
    '$fecha',
    '$folio',
    '$descripcion',
    '$tecnico',
    '$idCliente'
)";
$result = mysqli_query($conn, $sql);

if($result) {
    echo json_encode(array("success" => 1));
} else {
    $error = $conn->error;
    echo json_encode(array("success" => 0, "error" => $error
));
}
mysqli_close($conn);

?>