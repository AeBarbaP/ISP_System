<?php
require('../prcd/conn.php');

$folio = $_POST['folio'];

$sql = "SELECT * FROM pagos_generales WHERE folio_contrato = '$folio'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
$folio_contrato = $row['folio_contrato'];
$nombre = $row['nombre'];

?>