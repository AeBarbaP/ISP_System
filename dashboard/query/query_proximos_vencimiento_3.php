<?php
require_once("../prcd/conn.php");

$hoy = new DateTime(); // Fecha actual
$hoy->setTime(0, 0, 0); // Normalizar a medianoche para evitar problemas de comparación

$sql_clientes = "SELECT * FROM clientes";
$resultado_clientes = $conn->query($sql_clientes);

while ($cliente = $resultado_clientes->fetch_assoc()) {
    $fecha_contrato = new DateTime($cliente['fecha_contrato']);
    $fecha_corte = new DateTime($cliente['fecha_corte']);
    $folio = $cliente['folio'];

    // Calcula la diferencia entre las dos fechas
    $diferencia = $hoy->diff($fecha_corte);
    $diferencia = $diferencia->days;

    if($diferencia == 1){
        $dias_restantes = 100;
        $color = '#ee5b5b';
    }else if($diferencia == 2){
        $dias_restantes = 80;
        $color = '#fcd53b';
    }else if($diferencia == 3){
        $dias_restantes = 60;
        $color = '#fcd53b';
    }else if($diferencia == 4){
        $dias_restantes = 40;
        $color = '#0ddbb9';
    }else if($diferencia == 5){
        $dias_restantes = 20;
        $color = '#0ddbb9';
    }

    if ($diferencia <= 5){
    echo "
        <tr>
            <td style='padding:8px;'>{$cliente['folio']}</td>
            <td style='padding:8px;'>{$cliente['nombre']}</td>
            <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
            <td style='padding:8px;'>$" . number_format($cliente['cuota'], 2) . "</td>
            <td style='padding:8px;'>

            <div class='progress'>
                <div class='progress-bar' role='progressbar' style='width: {$dias_restantes}%; background-color: {$color};' 
                    aria-valuenow='{$dias_restantes}' aria-valuemin='0' aria-valuemax='100'>
                    {$diferencia} día" . ($diferencia != 1 ? 's' : '') . "
                </div>
            </div>

            
            </td>
        </tr>
        ";
    }
}
?>