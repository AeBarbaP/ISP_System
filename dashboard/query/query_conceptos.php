<?php
require('../prcd/conn.php');

if (!is_null($_POST['folio'])){

// Obtener el folio del cliente
$folioCliente = $_POST['folio'];
$recargo = '50.00'; // Valor del recargo

// Array para almacenar los meses adeudados
$adeudos = array();

if (!empty($folioCliente)) {
    // 1. Obtener fecha de corte del cliente
    $sqlCorte = "SELECT * FROM clientes WHERE folio = '$folioCliente'";
    $resultadoCorte = $conn->query($sqlCorte);
    $rowCorte = $resultadoCorte->fetch_assoc();

    $inicio = new DateTime($rowCorte['fecha_corte']);
    $fin = new DateTime();

    $diaN = '01';
    $mesN = $fin->format('m');
    $anioN = $inicio->format('Y');
    
    $diaM = $inicio->format('d');
    $mesM = $fin->format('m');
    $anioM = $inicio->format('Y');

    $annio = $fin->format('Y');

    $fechaNuevaCorte1 = new DateTime("$anioN-$mesN-$diaN");
    $fechaNuevaCorte2 = new DateTime("$anioM-$mesM-$diaM");


    $folioContrato = $rowCorte['folio'];
    $costoMensual = $rowCorte['cuota'];

    $meses = [
        '01' => 'Enero', '02' => 'Febrero', '03' => 'Marzo',
        '04' => 'Abril', '05' => 'Mayo', '06' => 'Junio',
        '07' => 'Julio', '08' => 'Agosto', '09' => 'Septiembre',
        '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre'
    ];

    if(($fin > $fechaNuevaCorte1) && ($fin < $fechaNuevaCorte2)){
        
        $nombreMesN = $meses[$mesM];

        $concat = "$annio-$mesM";
        $sql = "SELECT * FROM pagos_generales 
                WHERE folio_contrato = '$folioContrato' 
                AND periodo = '$concat'";

        $resultado = $conn->query($sql);
        // $row = $resultado->fetch_assoc();
        $filas = $resultado->num_rows;
        if($filas == 1){
            echo'
            <tr>
            <td>0000-00</td>
                <td>No tiene adeudos</td>
                <td>N/A</td>
                <td>0.00</td>
                <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
            </tr>';
        }
        else{
            echo'
            <tr>
            <td>'.$annio.'-'.$mesM.'</td>
            <td>Pago oportuno</td>
            <td>'.$nombreMesN.'</td>
            <td>'.$costoMensual.'</td>
            <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
            </tr>';
        }
        
        // <td colspan="5" class="table-success">No tiene adeudos</td>
        
    }

while ($inicio <= $fin) {
    // $dia = $inicio->format('d');
    $dia = '01';
    $mes = $inicio->format('m');
    $anio = $inicio->format('Y');

    // $fechaNuevaCorte = new DateTime($anio'-'$mes'-'$dia);

    // Consulta por mes y año en MySQL
    // $sql = "SELECT * FROM pagos_generales 
    //         WHERE folio_contrato = '$folioContrato' 
    //         AND MONTH(fecha_pago) = '$mes' 
    //         AND YEAR(fecha_pago) = '$anio'";
    $concat = "$anio-$mes";
    $sql = "SELECT * FROM pagos_generales 
            WHERE folio_contrato = '$folioContrato' 
            AND periodo = '$concat'";

    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();

    $adeudo = $inicio->format('Y-m');

    if ($row) {
        echo "
        <script>
            console.log('Ya existe un pago para el mes:" . $adeudo . "');
        </script>";
    } 
    else {
        $nombreMes = $meses[$mes]; // Obtener el nombre del mes en español
        // echo '<option value="'.$adeudo.'" data-categoria="1" data-costo="'.$rowCorte['cuota'].'" data-concepto="Recargo" data-periodo="'.$adeudo.'">'.$nombreMes.' '.$anio.'</option>';

        echo'
        <tr>
            <td>'.$adeudo.'</td>
            <td>Adeudo</td>
            <td>'.$nombreMes.'</td>
            <td>'.$costoMensual.'</td>
            <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
        </tr>
        <tr>
            <td>'.$adeudo.'</td>
            <td>Recargo</td>
            <td>'.$nombreMes.'</td>
            <td>'.$recargo.'</td>
            <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
        </tr>
        ';
    }

    $inicio->modify('+1 month');
}

}

} //fin if
else{
    return;
}


?>