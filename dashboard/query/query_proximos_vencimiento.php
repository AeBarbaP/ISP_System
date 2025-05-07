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

    // Avanzar mes a mes desde la fecha de contrato hasta hoy
    while ($fecha_corte <= $hoy) {
        $mes_actual = $fecha_corte->format('Y-m');

        // Verificar si ya hay un pago registrado para este mes
        $sql_pago = "SELECT * FROM pagos_generales 
                     WHERE folio_contrato = '$folio' 
                     AND DATE_FORMAT(fecha_pago, '%Y-%m') = '$mes_actual'";
        $resultado_pago = $conn->query($sql_pago);

        // Si NO hay pago, verificar si está dentro del rango de advertencia (1-5 días)
        if ($resultado_pago->num_rows == 0) {
            $dias_restantes = $hoy->diff($fecha_corte)->days;

            // Mostrar solo si faltan entre 1 y 5 días para el corte
            if ($dias_restantes >= 0 && $dias_restantes <= 5) {
                $porcentaje = (5 - $dias_restantes) * 20; // 1 día = 80%, 5 días = 0%
                $color = ($dias_restantes <= 2) ? 'bg-danger' : 'bg-warning';

                echo "<tr>
                        <td style='padding:8px;'>{$cliente['folio']}</td>
                        <td style='padding:8px;'>{$cliente['nombre']}</td>
                        <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
                        <td style='padding:8px;'>$" . number_format($cliente['cuota'], 2) . "</td>
                        <td style='padding:8px;'>
                            <div class='progress'>
                                <div class='progress-bar $color' role='progressbar' style='width: $porcentaje%' 
                                     aria-valuenow='$porcentaje' aria-valuemin='0' aria-valuemax='100'>
                                     $dias_restantes día" . ($dias_restantes != 1 ? 's' : '') . "
                                </div>
                            </div>
                        </td>
                    </tr>";
            }
        }

        // Avanzar al siguiente mes (fecha_corte += 1 mes)
        $fecha_corte->add(new DateInterval('P1M'));
    }
}
?>