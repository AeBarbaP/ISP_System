<?php
require_once("../prcd/conn.php");

// Configuración de paginación
$registrosPorPagina = 10; // Ajustado a 12 como mencionaste
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;

// QUERY PARA CONTAR REGISTROS
$sql_count = "SELECT COUNT(*) as total
            FROM clientes c
            WHERE 
                DATEDIFF(
                    DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(CURDATE()), '-', DAY(c.fecha_corte))),
                    CURDATE()
                ) BETWEEN 0 AND 6
                AND NOT EXISTS (
                    SELECT 1 FROM pagos_generales p 
                    WHERE p.folio_contrato = c.folio 
                    AND MONTH(p.fecha_pago) = MONTH(CURDATE())
                    AND YEAR(p.fecha_pago) = YEAR(CURDATE())
                )
            ";

$resultado_count = $conn->query($sql_count);
$totalRegistros = $resultado_count->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

// Primero obtenemos TODOS los IDs que cumplen con el rango de días
$inicio = ($paginaActual - 1) * $registrosPorPagina;

$sql_todos = "SELECT 
                c.id, 
                c.folio, 
                c.nombre, 
                c.cuota, 
                c.fecha_corte, 
                c.telefono,
                DATEDIFF(
                    DATE_ADD(
                        DATE_FORMAT(CURDATE(), '%Y-%m-01'),
                        INTERVAL DAY(c.fecha_corte)-1 DAY
                    ),
                    CURDATE()
                ) AS diferencia,
                DATE_ADD(
                    DATE_FORMAT(CURDATE(), '%Y-%m-01'),
                    INTERVAL DAY(c.fecha_corte)-1 DAY
                ) AS fecha_corte_actual
            FROM clientes c
            WHERE 
                DATEDIFF(
                    DATE_ADD(
                        DATE_FORMAT(CURDATE(), '%Y-%m-01'),
                        INTERVAL DAY(c.fecha_corte)-1 DAY
                    ),
                    CURDATE()
                ) BETWEEN 0 AND 6
                AND NOT EXISTS (
                    SELECT 1 
                    FROM pagos_generales p 
                    WHERE p.folio_contrato = c.folio 
                    AND MONTH(p.fecha_pago) = MONTH(CURDATE())
                    AND YEAR(p.fecha_pago) = YEAR(CURDATE())
                )
            ORDER BY diferencia ASC
            LIMIT $inicio, $registrosPorPagina
";

$resultado_todos = $conn->query($sql_todos);

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
                <th class="scope" style="font-weight: bold;"><i class="bi bi-whatsapp text-success"></i></th>
            </tr>
        </thead>
        <tbody>';

while ($cliente = $resultado_todos->fetch_assoc()) {
    $fecha_corte = new DateTime($cliente['fecha_corte_actual']);

    $diferencia = $cliente['diferencia'];
    
    // Asignación de colores y porcentajes
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
    } elseif ($diferencia > 6 && $diferencia <= 10) {
        $dias_restantes = 5;
        $color = '#0db9db';
    } elseif ($diferencia == 0) {
        $dias_restantes = 100;
        $color = '#ee5b5b';
    }

    $telefono = preg_replace('/\D/', '', $cliente['telefono']);

    echo "
    <tr>
        <td style='padding:8px;'>{$cliente['folio']}</td>
        <td style='padding:8px;'>{$cliente['nombre']}</td>
        <td style='padding:8px;'>
            <div class='progress'>
                <div class='progress-bar' role='progressbar' style='width: {$dias_restantes}%; background-color: {$color};' 
                    aria-valuenow='{$dias_restantes}' aria-valuemin='0' aria-valuemax='100'>
                    " . abs($diferencia) . " día" . (abs($diferencia) != 1 ? 's' : '') . "
                </div>
            </div>
        </td>
        <td style='padding:8px;'>$" . number_format($cliente['cuota'], 2) . "</td>
        <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
        <td><a href='https://wa.me/".$telefono."' target='_blank'><i class='bi bi-whatsapp'></i></td>
    </tr>";
}

echo '</tbody></table>';

// Generar HTML de la paginación solo si hay registros
if ($totalPaginas > 1) {
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
    $paginasAMostrar = 6;
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
} else {
    echo '<div class="alert alert-info">No hay registros que mostrar</div>';
}

echo '</div>'; // Cierre del table-responsive
?>