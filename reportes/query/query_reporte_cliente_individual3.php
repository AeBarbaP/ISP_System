<?php
require('../prcd/conn.php');

$cliente = $_POST['cliente'];
$fechaInicio = $_POST['fechaInicio'];
$fechaFinal = $_POST['fechaFinal'];
$x = 0;

$sqlPagosGenerales = "SELECT * FROM pagos_generales WHERE 
folio_contrato = '$cliente' AND 
(DATE(fecha_pago) BETWEEN '$fechaInicio' AND '$fechaFinal') 
ORDER BY id DESC";
$resultadoPagosGenerales = $conn->query($sqlPagosGenerales);
$totalSumaPagosGenerales = 0;
while($rowPagosGenerales = $resultadoPagosGenerales->fetch_assoc()){
    $x++;
    $totalSumaPagosGenerales = $totalSumaPagosGenerales + $rowPagosGenerales['total'];
    $folio = $rowPagosGenerales['folio_contrato'];
$rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
echo '

<tr>
    <td colspan="4">
        <div class="accordion" id="accordionExample'.$x.'">
            <div class="accordion-item">
                <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne'.$x.'" aria-expanded="true" aria-controls="collapseOne'.$x.'">
                    '.$rowCliente['nombre'].'
                    | '.$rowPagosGenerales['folio_contrato'].' | Fecha: '.$rowPagosGenerales['fecha_pago'].' | Total: $'.$rowPagosGenerales['total'].'
                </button>
                </h2>
                <div id="collapseOne'.$x.'" class="accordion-collapse collapse " data-bs-parent="#accordionExample'.$x.'">
                <div class="accordion-body">';
                    echo'
                    <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="table-secondary">
                                <th class="text-center">#</th>
                                <th class="text-center">Concepto</th>
                                <th class="text-center">Fecha Pago</th>
                                <th class="text-center">Total</th>
                            </tr>
                        </thead>
                        <tbody>';
                        $sql = "SELECT * FROM pagos WHERE 
                        folio_contrato = '$cliente' AND 
                        (fecha_pago BETWEEN '$fechaInicio' AND '$fechaFinal') 
                        ORDER BY id DESC";

                        $resultado = $conn->query($sql);
                        $x = 0;
                        $totalSuma = 0;
                        while($row = $resultado->fetch_assoc()){
                            $x++;
                            $totalSuma = $totalSuma + $row['total'];

                            echo'
                            <tr>
                                <td>'.$x.'</td>
                                <td>'.$row['concepto'].'</td>
                                <td>'.$row['periodo'].'</td>
                                <td>'.$row['total'].'</td>
                                
                            </tr>
                            ';
                        }    
                        echo'
                        </tbody>
                    </table>
                
                </div>
                </div>
            </div>
        </div>
    </td>
</tr>


';
}

echo'
<tr class="table-info">
    <td colspan="2" class="text-center"></td>
    <td colspan="1" class="text-center"><strong>Total:</strong></td>
    <td colspan="1" class="text-center">'.$totalSumaPagosGenerales.'</td>
</tr>
';
?>