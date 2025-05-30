<?php
require_once("../prcd/conn.php");

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

$diaHoy = $hoy->format('d');
$mesHoy = $hoy->format('m');
$anioHoy = $hoy->format('Y');

$sql_clientes = "SELECT * FROM clientes";
$resultado_clientes = $conn->query($sql_clientes);

while ($cliente = $resultado_clientes->fetch_assoc()) {
    $fecha_corte = new DateTime($cliente['fecha_corte']);
    $fecha_corte->setTime(0, 0, 0); // Normalizar

    $folio = $cliente['folio'];
    $diaCorte = $fecha_corte->format('d');
    $mesCorte = $fecha_corte->format('m');
    $anioCorte = $fecha_corte->format('Y');

    // Evita sobreescribir el resultado de clientes
    $sqlPagos = "SELECT * FROM pagos_generales 
                 WHERE folio_contrato = '$folio' 
                 AND MONTH(fecha_pago) = '$mesCorte' 
                 AND YEAR(fecha_pago) = '$anioHoy'";

    $resultado_pagos = $conn->query($sqlPagos);
    $filas = $resultado_pagos->num_rows;
    echo $filas;
    if ($filas == 0) {
        $diferencia = $hoy->diff($fecha_corte)->days;
        // Determina color y porcentaje
        if ($diferencia == 1) {
            $dias_restantes = 90;
            $color = '#ee5b5b';
        } else if ($diferencia == 2) {
            $dias_restantes = 80;
            $color = '#ee5b5b';
        } else if ($diferencia == 3) {
            $dias_restantes = 60;
            $color = '#fcd53b';
        } else if ($diferencia == 4) {
            $dias_restantes = 40;
            $color = '#fcd53b';
        } else if ($diferencia == 5) {
            $dias_restantes = 20;
            $color = '#0ddbb9';
        } else if ($diferencia == 6) {
            $dias_restantes = 10;
            $color = '#0ddbb9';
        } else if ($diferencia == 0) {
            $dias_restantes = 100;
            $color = '#ee5b5b';
        } else {
            // Fuera del rango de interés
            continue;
        }

        echo "
        <tr>
            <td style='padding:8px;'>{$cliente['folio']}</td>
            <td style='padding:8px;'>{$cliente['nombre']}</td>
            <td style='padding:8px;'>
                <div class='progress'>
                    <div class='progress-bar' role='progressbar' style='width: {$dias_restantes}%; background-color: {$color};' 
                        aria-valuenow='{$dias_restantes}' aria-valuemin='0' aria-valuemax='100'>
                        {$diferencia} día" . ($diferencia != 1 ? 's' : '') . "
                    </div>
                </div>
            </td>
            <td style='padding:8px;'>$" . number_format($cliente['cuota'], 2) . "</td>
            <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
        </tr>";
    }
}
?>