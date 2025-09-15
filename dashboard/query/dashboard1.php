<?php

require('../prcd/conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = new DateTime();
$mes = $fechaHoy->format('m');
$anio = $fechaHoy->format('Y');

// Configuración de paginación
$registrosPorPagina = 18; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

// Consulta para obtener el total de registros
$sqlTotal = "SELECT COUNT(*) as total FROM pagos_generales WHERE MONTH(fecha_pago) = MONTH(CURRENT_DATE()) AND YEAR(fecha_pago) = YEAR(CURRENT_DATE())";
$resultadoTotal = $conn->query($sqlTotal);
$totalRegistros = $resultadoTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql = "SELECT * FROM pagos_generales WHERE MONTH(fecha_pago) = MONTH(CURRENT_DATE()) AND YEAR(fecha_pago) = YEAR(CURRENT_DATE()) ORDER BY folio_pago DESC LIMIT $offset, $registrosPorPagina";
$resultado = $conn->query($sql);

echo '

    <table class="table table-striped table-hover mb-3">
        <thead style="background-color: aliceblue;">
            <tr class="text-center">
            <th class="scope" style="font-weight: bold;"># pago</th>
            <th class="scope" style="font-weight: bold;">Nombre del Cliente</th>
            <th class="scope" style="font-weight: bold;">Comunidad</th>
            <th class="scope" style="font-weight: bold;">Monto</th>
            <th class="scope" style="font-weight: bold;">Fecha de Pago</th>
            <th class="scope" style="font-weight: bold;">Periodo Pagado</th>
            <th class="scope" style="font-weight: bold;">Solicitar<br>Eliminar</th>
            </tr>
        </thead>
        <tbody id="dashboard1">

';

// Generar HTML de la tabla
while($row = $resultado->fetch_assoc()){
    $contrato = $row['folio_contrato'];
    $periodo = $row['periodo'];
    $sql2 = "SELECT * FROM clientes WHERE folio = '$contrato'";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    if ($row['estatus'] == 1){
        $estatus = '<a href="#" onclick="enviarSolicitud('.$row['id'].',0, event)"><i class="bi bi-exclamation-circle text-warning"></i></a>';
    }
    else {
        $estatus = '<a href="#" onclick="enviarSolicitud('.$row['id'].',1, event)"><i class="bi bi-exclamation-circle text-secondary"></i></a>';
    }

    echo '
    <tr class="text-center">
        <td onclick="abrirModalPagos(\'' . $row['periodo'] . '\', \'' . $row['folio_pago'] . '\')">' . $row['folio_pago'] . '</td>
        <td onclick="abrirModalPagos(\'' . $row['folio_pago'] . '\', \'' . $row['periodo'] . '\')">' . $row2['nombre'] . '</td>
        <td onclick="abrirModalPagos(\'' . $row['folio_pago'] . '\', \'' . $row['periodo'] . '\')">' . $row2['comunidad'] . '</td>
        <td onclick="abrirModalPagos(\'' . $row['folio_pago'] . '\', \'' . $row['periodo'] . '\')">$' . $row['total'] . '</td>
        <td onclick="abrirModalPagos(\'' . $row['folio_pago'] . '\', \'' . $row['periodo'] . '\')">' . $row['fecha_pago'] . '</td>
        <td onclick="abrirModalPagos(\'' . $row['folio_pago'] . '\', \'' . $row['periodo'] . '\')">' . $row['periodo'] . '</td>
        <td>' . $estatus . '</td>
    </tr>
    ';
}

echo'
        </tbody>
    </table>
';

// Generar HTML de la paginación
echo '<nav aria-label="Page navigation">
<ul class="pagination justify-content-end">';

// Botón Anterior
if($paginaActual > 1) {
    echo '<li class="page-item">
            <a class="page-link paginacion" href="#" data-pagina="'.($paginaActual - 1).'" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&laquo;</span>
        </li>';
}

// Números de página
for($i = 1; $i <= $totalPaginas; $i++) {
    $active = ($i == $paginaActual) ? 'active' : '';
    echo '
        <li class="page-item '.$active.'">
            <a class="page-link paginacion" href="#" data-pagina="'.$i.'">'.$i.'</a>
        </li>
    ';
}

// Botón Siguiente
if($paginaActual < $totalPaginas) {
    echo '
        <li class="page-item">
            <a class="page-link paginacion" href="#" data-pagina="'.($paginaActual + 5).'" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    ';
} else {
    echo '
        <li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&raquo;</span>
        </li>
    ';
}

echo '</ul></nav>';

?>