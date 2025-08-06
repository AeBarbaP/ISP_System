<?php

require('../prcd/conn.php');

$fechaHoy = new DateTime();
$dia = $fechaHoy->format('d');
$mes = $fechaHoy->format('m');
$anio = $fechaHoy->format('Y');


// Configuración de paginación
$registrosPorPagina = 18; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

// Consulta para obtener el total de registros
$sqlTotal = "SELECT COUNT(*) as total FROM otros_gastos";
$resultadoTotal = $conn->query($sqlTotal);
$totalRegistros = $resultadoTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql = "SELECT * FROM otros_gastos WHERE DAY(fecha) = '$dia' AND MONTH(fecha) = '$mes' AND YEAR(fecha) = '$anio' ORDER BY fecha DESC LIMIT $offset, $registrosPorPagina";
$resultado = $conn->query($sql);
$x = 0;
echo '

<table class="table table-striped table-hover mb-3">
    <thead style="background-color: aliceblue;">
        <tr class="text-center">
            <th class="scope" style="font-weight: bold;">#</th>
            <th class="scope" style="font-weight: bold;">Concepto</th>
            <th class="scope" style="font-weight: bold;">Monto</th>
            <th class="scope" style="font-weight: bold;">Fecha de Pago</th>
        </tr>
    </thead>
    <tbody id="dashboardGastos">

';

// Generar HTML de la tabla
while($row = $resultado->fetch_assoc()){
    $x++;
    echo '
    <tr class="text-center">
        <td>' . $x . '</td>
        <td>' . $row['concepto'] . '</td>
        <td>$' . $row['cantidad'] . '</td>
        <td>' . $row['fecha'] . '</td>
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