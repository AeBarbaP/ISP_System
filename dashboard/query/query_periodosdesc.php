<?php
require('../prcd/conn.php');

if (!empty($_POST['folio'])) {
    $folio = $_POST['folio'];
    $recargo = 50.00;

    // 1. Obtener datos del cliente - CORRECCIÓN IMPORTANTE
    $cliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $cuota = $cliente['cuota'];
    
    // CORRECCIÓN: Crear objeto DateTime desde la fecha_corte
    $fecha_corte = new DateTime($cliente['fecha_corte']);
    $dia_corte = $fecha_corte->format('d'); // Día de corte del cliente (ej. 15)

    // 2. Configuración de meses
    $meses = [
        '01'=>'Enero', '02'=>'Febrero', '03'=>'Marzo', '04'=>'Abril',
        '05'=>'Mayo', '06'=>'Junio', '07'=>'Julio', '08'=>'Agosto',
        '09'=>'Septiembre', '10'=>'Octubre', '11'=>'Noviembre', '12'=>'Diciembre'
    ];

    // 3. Fechas clave
    $hoy = new DateTime();
    $mes_actual = $hoy->format('Y-m');
    $mes_anterior1 = (clone $hoy)->modify('-1 month')->format('Y-m');
    $mes_anterior2 = (clone $hoy)->modify('-1 month')->format('Y-m');

    // 4. Calcular fecha de corte del mes actual - CORRECCIÓN
    $fecha_corte_mes_actual = new DateTime($hoy->format('Y-m-').$dia_corte);
    $pago_oportuno = ($hoy <= $fecha_corte_mes_actual);

    // 5. Procesar meses
    $resultados = [];
    $adeudos = [];
    
    foreach ([$mes_anterior2, $mes_anterior1, $mes_actual] as $periodo) {
        $pago = $conn->query("SELECT 1 FROM pagos WHERE folio_contrato = '$folio' AND periodo = '$periodo'");
        
        if ($pago->num_rows == 0) {
            $es_actual = ($periodo == $mes_actual);
            $concepto = $es_actual && $pago_oportuno ? 'Pago oportuno' : 'Adeudo';
            
            $mes_num = explode('-', $periodo)[1];
            $resultados[$periodo] = [
                'periodo' => $periodo,
                'concepto' => $concepto,
                'mes' => $meses[$mes_num],
                'monto' => $cuota
            ];

            if ($concepto == 'Adeudo') {
                $adeudos[] = $periodo;
            }
        }
    }

    // 6. Generar salida
    if (empty($resultados)) {
        echo '<tr><td>0000-00</td><td>No tiene adeudos</td><td>N/A</td><td>0.00</td><td><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></td></tr>';
    } else {
        // Ordenar por fecha (más antiguo primero)
        ksort($resultados);
        
        foreach ($resultados as $item) {

            $clase_fila = '';
            if ($item['concepto'] == 'Adeudo') {
                $clase_fila = 'table-warning'; // Rojo para adeudos
            } elseif ($item['concepto'] == 'Pago oportuno') {
                $clase_fila = 'table-primary'; // Verde para pagos oportunos
            } elseif ($item['concepto'] == 'Pago anticipado') {
                $clase_fila = 'table-info'; // Azul claro para pagos adelantados
            }
            echo "<tr class='$clase_fila'>
                <td>{$item['periodo']}</td>
                <td>{$item['concepto']}</td>
                <td>{$item['mes']}</td>
                <td>{$item['monto']}</td>
                <td><span class='badge bg-danger' onclick='eliminarTr(this)'><i class='bi bi-trash'></i> Eliminar</span></td>
            </tr>";
        }

        // Mostrar recargo solo si hay adeudos reales (no pagos oportunos)
        if (!empty($adeudos)) {
            $ultimo_adeudo = end($adeudos);
            $mes_num = explode('-', $ultimo_adeudo)[1];
            echo "<tr class='table-warning'>
                <td>$ultimo_adeudo</td>
                <td>Reconexión</td>
                <td>{$meses[$mes_num]}</td>
                <td>$recargo</td>
                <td><span class='badge bg-danger' onclick='eliminarTr(this)'><i class='bi bi-trash'></i> Eliminar</span></td>
            </tr>";
        }
    }
}
?>