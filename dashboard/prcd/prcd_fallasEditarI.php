<?php
session_start();
require_once ('conn.php');

$username = $_SESSION['username'];


$id = $_POST['id'];
$estatus = $_POST['estatus'];

$sql = "UPDATE incidencias SET (
    estatus
) VALUES (
    '$estatus'
) WHERE id = '$id'";

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