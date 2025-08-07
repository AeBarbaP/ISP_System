<?php

require('../prcd/conn.php');

$fechaHoy = new DateTime();
$mes = $fechaHoy->format('m');
$anio = $fechaHoy->format('Y');

$filtro = $_POST['texto'];
// Configuración de paginación
$registrosPorPagina = 18; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

// Consulta para obtener el total de registros
$sqlTotal = "SELECT COUNT(*) as total FROM pagos_generales";
$resultadoTotal = $conn->query($sqlTotal);
$totalRegistros = $resultadoTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$filtro%' LIMIT $offset, $registrosPorPagina";
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
        </tr>
    </thead>
    <tbody id="dashboard1">

';

// Generar HTML de la tabla
while($row = $resultado->fetch_assoc()){
    $contrato = $row['folio'];
    $sql2 = "SELECT * FROM pagos_generales WHERE MONTH(fecha_pago) = '$mes' AND YEAR(fecha_pago) = '$anio' AND folio_contrato = '$contrato' ORDER BY fecha_pago DESC";
    $resultado2 = $conn->query($sql2);
    $row2 = $resultado2->fetch_assoc();

    $filas = $resultado2->num_rows;
    if ($filas > 0) {
        
        
        echo '
        <tr class="text-center" onclick="abrirModalPagos(\'' . $row['folio'] . '\')">
        <td>' . $row['folio'] . '</td>
        <td>' . $row['nombre'] . '</td>
        <td>' . $row['comunidad'] . '</td>
        <td>$' . $row['cuota'] . '</td>
        <td>' . $row2['fecha_pago'] . '</td>
        <td>' . $row2['periodo'] . '</td>
        </tr>
        ';
    }
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
    echo '<li class="page-item '.$active.'">
            <a class="page-link paginacion" href="#" data-pagina="'.$i.'">'.$i.'</a>
          </li>';
}

// Botón Siguiente
if($paginaActual < $totalPaginas) {
    echo '<li class="page-item">
            <a class="page-link paginacion" href="#" data-pagina="'.($paginaActual + 1).'" aria-label="Next">
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