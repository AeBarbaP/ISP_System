<?php
require('../../dashboard/prcd/conn.php');

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
));

?>