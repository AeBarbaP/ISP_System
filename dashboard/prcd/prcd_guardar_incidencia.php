<?php

require_once ('conn.php');

$fecha = $_POST['fecha'];
$folio = $_POST['folio'];
$descripcion = $_POST['descripcion'];
$tecnico = $_POST['tecnico'];
$fechaAsignacion = $_POST['fecha_asignacion'];
$idCliente = $_POST['id_cliente'];

$sql = "INSERT INTO incidencias (
    fecha,
    folio_incidencia,
    descripcion,
    tecnico,
    fecha_asignacion,
    id_cliente
) VALUES (
    '$fecha',
    '$folio',
    '$descripcion',
    '$tecnico',
    '$fechaAsignacion',
    '$idCliente'
)";
$result = mysqli_query($conn, $sql);

if($result) {
    echo json_encode(array("success" => 1));
} else {
    echo json_encode(array("success" => 0));
}
mysqli_close($conn);

?>