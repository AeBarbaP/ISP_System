<?php

require('../prcd/conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');

$fechaHoy = new DateTime();
$mes = $fechaHoy->format('m');
$anio = $fechaHoy->format('Y');

$filtro = $_POST['texto'];
// Configuración de paginación
$registrosPorPagina = 18; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

// Consulta para obtener el total de registros
$sqlTotal = "SELECT COUNT(*) as total FROM pagos_generales WHERE MONTH(fecha_pago) = '$filtro' AND YEAR(fecha_pago) = YEAR(CURRENT_DATE())";
$resultadoTotal = $conn->query($sqlTotal);
$totalRegistros = $resultadoTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

$sql = "SELECT * FROM pagos_generales WHERE MONTH(fecha_pago) = '$filtro' AND YEAR(fecha_pago) = YEAR(CURRENT_DATE()) ORDER BY fecha_pago DESC LIMIT $offset, $registrosPorPagina";
$resultado = $conn->query($sql);

// Consulta principal con paginación
//$sql = "SELECT * FROM clientes WHERE nombre LIKE '%$filtro%'";
//$resultado = $conn->query($sql);


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
while($row1 = $resultado->fetch_assoc()){
    $contrato = $row1['folio_contrato'];
    
    $row2 = $conn->query("SELECT * FROM clientes WHERE folio = '$contrato'")->fetch_assoc();

    //$sql2 = "SELECT * FROM pagos_generales WHERE MONTH(fecha_pago) = '$mes' AND YEAR(fecha_pago) = '$anio' AND folio_contrato = '$contrato' ORDER BY fecha_pago DESC";
    //$resultado2 = $conn->query($sql2);
    //$filas = $resultado2->num_rows;
    //if ($filas > 0) {
    
        //while($row2 = $resultado2->fetch_assoc()){

            if ($row1['estatus'] == 1){
                $estatus = '<a href="#" onclick="enviarSolicitud2('.$row1['id'].',0, event)"><i class="bi bi-exclamation-circle text-warning"></i></a>';
            }
            else {
                $estatus = '<a href="#" onclick="enviarSolicitud2('.$row1['id'].',1, event)"><i class="bi bi-exclamation-circle text-secondary"></i></a>';
            }

            echo '
                <tr class="text-center">
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">' . $row1['folio_pago'] . '</td>
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">' . $row2['nombre'] . '</td>
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">' . $row2['comunidad'] . '</td>
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">$' . $row1['total'] . '</td>
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">' . $row1['fecha_pago'] . '</td>
                    <td onclick="abrirModalPagos(\'' . $row1['folio_pago'] . '\', \'' . $row1['periodo'] . '\')">' . $row1['periodo'] . '</td>
                    <td>' . $estatus . '</td>
                </tr>
            ';
       // }
    //}
}

echo'
</tbody>
    </table>
';

// Generar HTML de la paginación
echo '<nav aria-label="Page navigation">
<ul class="pagination justify-content-end">';

// Botón Primera Página
if($paginaActual > 1) {
    echo '<li class="page-item">
            <a class="page-link paginacion" href="#" data-pagina="1" aria-label="First">
                <span aria-hidden="true">&laquo;&laquo;</span>
            </a>
        </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&laquo;&laquo;</span>
        </li>';
}

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

// Calcular rango de páginas a mostrar (grupos de 5)
$paginasPorGrupo = 5;
$grupoActual = ceil($paginaActual / $paginasPorGrupo);
$paginaInicio = (($grupoActual - 1) * $paginasPorGrupo) + 1;
$paginaFin = min($paginaInicio + $paginasPorGrupo - 1, $totalPaginas);

// Números de página (solo 5 por grupo)
for($i = $paginaInicio; $i <= $paginaFin; $i++) {
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
            <a class="page-link paginacion" href="#" data-pagina="'.($paginaActual + 1).'" aria-label="Next">
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

// Botón Última Página
if($paginaActual < $totalPaginas) {
    echo '<li class="page-item">
            <a class="page-link paginacion" href="#" data-pagina="'.$totalPaginas.'" aria-label="Last">
                <span aria-hidden="true">&raquo;&raquo;</span>
            </a>
        </li>';
} else {
    echo '<li class="page-item disabled">
            <span class="page-link" aria-hidden="true">&raquo;&raquo;</span>
        </li>';
}

echo '</ul></nav>';

?>