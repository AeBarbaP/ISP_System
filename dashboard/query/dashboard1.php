<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM pagos_generales ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $contrato = $row['folio_contrato'];
    $sql2 = "SELECT * FROM clientes WHERE folio = '$contrato'";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();
    echo'
    <tr class="text-center" data-href="#" data-bs-toggle="modal" data-bs-target="#listaPagosInv">
        <td>' . $row['folio_contrato'] . '</td>
        <td>' . $row2['nombre'] . '</td>
        <td>$' . $row['total'] . '</td>
        <td>' . $row['fecha_pago'] . '</td>
    </tr>
    ';
}

?>