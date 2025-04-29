<?php

require_once("../prcd/conn.php");

$fechaActual = new DateTime();

$sql = "SELECT * FROM clientes";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $fecha = new DateTime($row['fecha_corte']);
    $folio = $row['folio'];
    $sql2 = "SELECT * FROM pagos_generales WHERE folio_contrato = '$folio'";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    // while para obtener el recorrido de pagos
        while($fecha <= $fechaActual) {
            $mes_actual = $fecha->format('Y-m');
            
            // 5. Consulta REAL a pagos_generales
            $sql = "SELECT * FROM pagos_generales 
                    WHERE DATE_FORMAT(fecha_pago, '%Y-%m') = '$mes_actual'";
            $resultado = $conn->query($sql);
            
            // 6. Mostrar resultados
            echo "<tr>
                    <td style='padding:8px;'>".$fecha->format('m/Y')."</td>";
            
            if($resultado->num_rows > 0) {
                $pago = $resultado->fetch_assoc();
                echo "<td style='color:green; padding:8px;'>✅ PAGADO</td>
                    <td style='padding:8px;'>$".number_format($pago['total'], 2)."</td>";
            } else {
                echo "<td style='color:red; padding:8px;'>❌ PENDIENTE</td>
                    <td style='padding:8px;'>$0.00</td>";
            }
            
            echo "</tr>";
            $fecha->add(new DateInterval('P1M')); // Siguiente mes
        }
    // while para obtener el recorrido de pagos
}
