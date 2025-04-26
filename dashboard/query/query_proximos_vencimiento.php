<?php

require_once("../prcd/conn.php");

$sql = "SELECT * FROM clientes";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $folio = $row['folio'];
    $sql2 = "SELECT * FROM pagos_generales WHERE folio_contrato = '$folio'";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    echo'
    <tr>
        <td class="py-1">
            '.$row['folio'].'
        </td>
        <td>
            '.$row['nombre'].'
        </td>
        <td>
            <div class="progress">
            <div class="progress-bar bg-success"  role="progressbar" style="width: 19%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </td>
        <td>
            Monto
        </td>
        <td>
            '.$row['fecha_corte'].'
        </td>
    </tr>
';
}
