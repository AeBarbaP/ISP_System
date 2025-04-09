<?php
require('../../dashboard/prcd/conn.php');

$sql = "SELECT * FROM pagos ORDER BY id DESC";
$resultado = $conn->query($sql);
$x = 0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $numPago = $row['num_pago'];
    $folioContrato = $row['folio_contrato'];
    $fechaPago = $row['fecha_pago'];
    $id = $row['id'];
    $tipoPago = $row['tipo_pago'];
    $total = $row['total'];

    echo'
    <tr>
        <td>'.$numPago.'</td>
        <td>'.$folioContrato.'</td>
        <td>'.$fechaPago.'</td>
        <td>'.$tipoPago.'</td>
        <td>'.$total.'</td>
        
        ';
        if($estatus == 1){
            echo'
            <td><a href="#" onclick="cambiaEstatusContrato('.$id.')"><i class="bi bi-check-circle text-success"></i></a></td>
            ';
        }
        else{
            echo'
            <td><a href="#" onclick="cambiaEstatusContrato('.$id.')"><i class="bi bi-x-circle-fill text-danger"></i></a></td>
            ';
        }
    echo'
        <td><a href="#" data-bs-toggle="modal" data-bs-target="#reportePagoIndividual" onclick="queryPagoIndividual()"><i class="bi bi-pencil-square"></i></a></td>
    </tr>
    ';
}

?>