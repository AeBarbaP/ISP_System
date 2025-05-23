<?php
session_start();
require_once ('conn.php');

$username = $_SESSION['username'];


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
} else {
    $error = $conn->error;
    echo json_encode(array("success" => 0, "error" => $error
));
}
mysqli_close($conn);

?>