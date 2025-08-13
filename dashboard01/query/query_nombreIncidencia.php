<?php
require('../prcd/conn.php');

$usuario = $_POST['usuario'];

$sql = "SELECT * FROM clientes WHERE folio = '$usuario'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$sqlIncidecia = "SELECT * FROM incidencias WHERE folio_cliente = '$usuario'";
$resultadoIncidencia = $conn->query($sqlIncidecia);
$rowIncidencia = $resultadoIncidencia->fetch_assoc();
$incidecia = $rowIncidencia['descripcion'];
$estatus = $rowIncidencia['estatus'];

echo json_encode(array(
    'success'=>1,
    'usuario'=>$row['nombre'],
    'incidencia'=>$incidecia,
    'estatus'=>$estatus
));


?>