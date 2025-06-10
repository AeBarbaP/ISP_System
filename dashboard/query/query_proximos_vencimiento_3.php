<?php
// require_once("../prcd/conn.php");

// $hoy = new DateTime();
// $hoy->setTime(0, 0, 0);

// $diaHoy = $hoy->format('d');
// $mesHoy = $hoy->format('m');
// $anioHoy = $hoy->format('Y');

// $sql_clientes = "SELECT * FROM clientes";
// $resultado_clientes = $conn->query($sql_clientes);

// while ($cliente = $resultado_clientes->fetch_assoc()) {
//     $fecha_corte = new DateTime($cliente['fecha_corte']);
//     $fecha_corte->setTime(0, 0, 0); // Normalizar

//     $folio = $cliente['folio'];
//     $diaCorte = $fecha_corte->format('d');
//     $mesCorte = $fecha_corte->format('m');
//     $anioCorte = $fecha_corte->format('Y');

//     // Evita sobreescribir el resultado de clientes
//     $sqlPagos = "SELECT * FROM pagos_generales 
//                  WHERE folio_contrato = '$folio' 
//                  AND MONTH(fecha_pago) = '$mesCorte' 
//                  AND YEAR(fecha_pago) = '$anioHoy'";

//     $resultado_pagos = $conn->query($sqlPagos);
//     $filas = $resultado_pagos->num_rows;
//     echo $filas;
//     if ($filas == 0) {
//         $diferencia = $hoy->diff($fecha_corte)->days;
//         // Determina color y porcentaje
//         if ($diferencia == 1) {
//             $dias_restantes = 90;
//             $color = '#ee5b5b';
//         } else if ($diferencia == 2) {
//             $dias_restantes = 80;
//             $color = '#ee5b5b';
//         } else if ($diferencia == 3) {
//             $dias_restantes = 60;
//             $color = '#fcd53b';
//         } else if ($diferencia == 4) {
//             $dias_restantes = 40;
//             $color = '#fcd53b';
//         } else if ($diferencia == 5) {
//             $dias_restantes = 20;
//             $color = '#0ddbb9';
//         } else if ($diferencia == 6) {
//             $dias_restantes = 10;
//             $color = '#0ddbb9';
//         } else if ($diferencia == 0) {
//             $dias_restantes = 100;
//             $color = '#ee5b5b';
//         } else {
//             // Fuera del rango de interés
//             continue;
//         }

//         echo "
//         <tr>
//             <td style='padding:8px;'>{$cliente['folio']}</td>
//             <td style='padding:8px;'>{$cliente['nombre']}</td>
//             <td style='padding:8px;'>
//                 <div class='progress'>
//                     <div class='progress-bar' role='progressbar' style='width: {$dias_restantes}%; background-color: {$color};' 
//                         aria-valuenow='{$dias_restantes}' aria-valuemin='0' aria-valuemax='100'>
//                         {$diferencia} día" . ($diferencia != 1 ? 's' : '') . "
//                     </div>
//                 </div>
//             </td>
//             <td style='padding:8px;'>$" . number_format($cliente['cuota'], 2) . "</td>
//             <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
//         </tr>";
//     }
// }
?>

<?php
require_once("../prcd/conn.php");

// Configuración de paginación
$registrosPorPagina = 10; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

// Primero contamos los registros totales que cumplen con los criterios
$sql_count = "SELECT COUNT(*) as total FROM clientes c 
              WHERE NOT EXISTS (
                  SELECT 1 FROM pagos_generales p 
                  WHERE p.folio_contrato = c.folio 
                  AND MONTH(p.fecha_pago) = MONTH(c.fecha_corte) 
                  AND YEAR(p.fecha_pago) = YEAR(CURDATE())
              )";
$resultado_count = $conn->query($sql_count);
$totalRegistros = $resultado_count->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql_clientes = "SELECT * FROM clientes c 
                 WHERE NOT EXISTS (
                     SELECT 1 FROM pagos_generales p 
                     WHERE p.folio_contrato = c.folio 
                     AND MONTH(p.fecha_pago) = MONTH(c.fecha_corte) 
                     AND YEAR(p.fecha_pago) = YEAR(CURDATE())
                 )
                 LIMIT $offset, $registrosPorPagina";
$resultado_clientes = $conn->query($sql_clientes);

echo '
<div class="table-responsive">
    <table class="table table-hover text-center">
        <caption>de 1 a 6 días antes de la fecha límite de pago.</caption>
        <thead style="background-color: aliceblue;" class="text-dark">
            <tr>
                <th class="scope" style="font-weight: bold;">Contrato</th>
                <th class="scope" style="font-weight: bold;">Nombre del Cliente</th>
                <th class="scope" style="font-weight: bold;">Progreso de Vencimiento</th>
                <th class="scope" style="font-weight: bold;">Monto</th>
                <th class="scope" style="font-weight: bold;">Fecha Límite de Pago</th>
            </tr>
        </thead>
        <tbody id="tablaProximos">';

while ($cliente = $resultado_clientes->fetch_assoc()) {
    $fecha_corte = new DateTime($cliente['fecha_corte']);
    $fecha_corte->setTime(0, 0, 0);
    
    $diferencia = $hoy->diff($fecha_corte)->days;
    
    // Determina color y porcentaje según días restantes
    if ($diferencia == 1) {
        $dias_restantes = 90;
        $color = '#ee5b5b';
    } elseif ($diferencia == 2) {
        $dias_restantes = 80;
        $color = '#ee5b5b';
    } elseif ($diferencia == 3) {
        $dias_restantes = 60;
        $color = '#fcd53b';
    } elseif ($diferencia == 4) {
        $dias_restantes = 40;
        $color = '#fcd53b';
    } elseif ($diferencia == 5) {
        $dias_restantes = 20;
        $color = '#0ddbb9';
    } elseif ($diferencia == 6) {
        $dias_restantes = 10;
        $color = '#0ddbb9';
    } elseif ($diferencia == 0) {
        $dias_restantes = 100;
        $color = '#ee5b5b';
    } else {
        continue; // Saltar registros fuera del rango 0-6 días
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

echo'
</tbody>
    </table>
    ';

// Generar HTML de la paginación
echo '<nav aria-label="Page navigation">
<ul class="pagination justify-content-end mt-3">';

// Botón Anterior
if($paginaActual > 1) {
    echo '<li class="page-item">
            <a class="page-link paginacion-vencimientos" href="#" data-pagina="'.($paginaActual - 1).'" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
          </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&laquo;</span>
          </li>';
}

// Números de página
$paginasAMostrar = 5; // Número máximo de páginas a mostrar
$inicio = max(1, $paginaActual - floor($paginasAMostrar/2));
$fin = min($totalPaginas, $inicio + $paginasAMostrar - 1);

for($i = $inicio; $i <= $fin; $i++) {
    $active = ($i == $paginaActual) ? 'active' : '';
    echo '<li class="page-item '.$active.'">
            <a class="page-link paginacion-vencimientos" href="#" data-pagina="'.$i.'">'.$i.'</a>
          </li>';
}

// Botón Siguiente
if($paginaActual < $totalPaginas) {
    echo '<li class="page-item">
            <a class="page-link paginacion-vencimientos" href="#" data-pagina="'.($paginaActual + 1).'" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
          </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&raquo;</span>
          </li>';
}

echo '</ul></nav>';
?>