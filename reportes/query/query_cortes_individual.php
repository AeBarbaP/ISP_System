<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM cortes WHERE estatus = 1 ORDER BY id DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){

    echo'
        <option value="'.$row['folio_corte'].'">'.$row['folio_corte'].' | '.$row['folio_cliente'].'</option>
    ';

}


?>