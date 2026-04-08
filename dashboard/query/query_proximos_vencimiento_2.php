<?php
require_once("../prcd/conn.php");

// Configuración de paginación
$registrosPorPagina = 12; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

$hoy = new DateTime();
$hoy->setTime(0, 0, 0);

// Primero contamos los registros totales
$sql_count = "SELECT COUNT(*) as total
                FROM (
                    SELECT 
                        c.folio,
                        CASE 
                            WHEN DAY(CURDATE()) >= DAY(c.fecha_corte)
                            THEN DATE_ADD(
                                    DATE_FORMAT(CURDATE(), '%Y-%m-01'),
                                    INTERVAL (DAY(c.fecha_corte)-1) DAY
                                )
                            ELSE DATE_ADD(
                                    DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01'),
                                    INTERVAL (DAY(c.fecha_corte)-1) DAY
                                )
                        END AS fecha_corte_real
                    FROM clientes c
                ) AS t
                WHERE 
                    t.fecha_corte_real <= DATE_SUB(CURDATE(), INTERVAL 10 DAY)
            ";
$resultado_count = $conn->query($sql_count);
$totalRegistros = $resultado_count->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql_clientes = "SELECT 
    t.*,
    DATEDIFF(CURDATE(), t.fecha_corte_real) AS dias_vencido

        FROM (
            SELECT 
                c.id,
                c.folio,
                c.nombre,
                c.cuota,
                c.telefono,
                CASE 
                    WHEN DAY(CURDATE()) >= DAY(c.fecha_corte)
                    THEN DATE_ADD(
                            DATE_FORMAT(CURDATE(), '%Y-%m-01'),
                            INTERVAL (DAY(c.fecha_corte)-1) DAY
                        )
                    ELSE DATE_ADD(
                            DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01'),
                            INTERVAL (DAY(c.fecha_corte)-1) DAY
                        )
                END AS fecha_corte_real
            FROM clientes c
        ) AS t

        WHERE 
            t.fecha_corte_real <= DATE_SUB(CURDATE(), INTERVAL 10 DAY)

        ORDER BY dias_vencido DESC
        LIMIT $offset, $registrosPorPagina;
";

$resultado_clientes = $conn->query($sql_clientes);

if ($resultado_clientes->num_rows == 0) {
    echo "<tr><td colspan='5'>No hay clientes con más de 10 días de vencimiento</td></tr>";
}

echo'

<table class="table table-hover text-center mb-2">
    <caption>Clientes con 10 a 30 días de vencimiento.</caption>
    <thead style="background-color: aliceblue;" class="text-dark">
        <tr>
            <th class="scope" style="font-weight: bold;">
                Contrato
            </th>
            <th class="scope" style="font-weight: bold;">
                Nombre del Cliente
            </th>
            <th class="scope" style="font-weight: bold;">
                Progreso de Vencimiento
            </th>
            <th class="scope" style="font-weight: bold;">
                Monto
            </th>
            <th class="scope" style="font-weight: bold;">
                Fecha Límite de Pago
            </th>
        </tr>
    </thead>
    <tbody>
';

while ($cliente = $resultado_clientes->fetch_assoc()) {
    $fecha_corte = new DateTime($cliente['fecha_corte_real']);
    $dias_vencido = $cliente['dias_vencido'];
    
    if ($dias_vencido >= 20) {
        $dias_restantes = 100;
        $color = '#8b0000';
    } elseif ($dias_vencido >= 15) {
        $dias_restantes = 80;
        $color = '#dc3545';
    } else {
        $dias_restantes = 60;
        $color = '#ff6b6b';
    }
        
        $monto = number_format($cliente['cuota'], 2);

    echo "
        <tr>
            <td style='padding:8px;'>{$cliente['folio']}</td>
            <td style='padding:8px;'>{$cliente['nombre']}</td>
            <td style='padding:8px;'>
                <div class='progress'>
                    <div class='progress-bar' role='progressbar' 
                        style='width: {$dias_restantes}%; background-color: {$color};'>
                        " . $dias_vencido . " días vencido
                    </div>
                </div>
            </td>
            <td style='padding:8px;'>\${$monto}</td>
            <td style='padding:8px;'>{$fecha_corte->format('d/m/Y')}</td>
        </tr>
    ";
    
}

echo '
</tbody>
</table>';

// Generar HTML de la paginación
echo '<nav aria-label="Page navigation">
<ul class="pagination justify-content-end">';

// Botón Anterior
if($paginaActual > 1) {
    echo '<li class="page-item">
            <a class="page-link paginacion-proximos" href="#" data-pagina="'.($paginaActual - 1).'" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
          </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&laquo;</span>
          </li>';
}

// Números de página
$paginasAMostrar = 6; // Número máximo de páginas a mostrar en la navegación
$inicio = max(1, $paginaActual - floor($paginasAMostrar/2));
$fin = min($totalPaginas, $inicio + $paginasAMostrar - 1);

for($i = $inicio; $i <= $fin; $i++) {
    $active = ($i == $paginaActual) ? 'active' : '';
    echo '<li class="page-item '.$active.'">
            <a class="page-link paginacion-proximos" href="#" data-pagina="'.$i.'">'.$i.'</a>
          </li>';
}

// Botón Siguiente
if($paginaActual < $totalPaginas) {
    echo '<li class="page-item">
            <a class="page-link paginacion-proximos" href="#" data-pagina="'.($paginaActual + 1).'" aria-label="Next">
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
