<?php
session_start();
require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

// --------- log ---------------
$sqlLOG = "INSERT INTO log_users(
username,
accion,
hora,
folio_cliente
)
VALUES(
'$userLog',
22,
'$fechaHoy',
'NA')
";
$resultadoLOG = $conn->query($sqlLOG);
// --------- log ---------------
// $error = $conn->error;
// echo $error;
session_destroy();
$_SESSION = [];

echo "<script type=\"text/javascript\">location.href='../index.html';</script>";


?>