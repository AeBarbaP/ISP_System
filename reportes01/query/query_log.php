<?php
// require('../prcd/conn.php');

// $sql = "SELECT * FROM log_users ORDER BY id DESC";
// $resultado = $conn->query($sql);
// $x = 0;
// while($row = $resultado->fetch_assoc()){
//     $accion = $row['accion'];
//     $sqlAccion = "SELECT * FROM catalogo_logs WHERE id = '$accion'";
//     $resultadoAccion = $conn->query($sqlAccion);
//     $rowAccion = $resultadoAccion->fetch_assoc();
//     $x++;
//     echo'
//     <tr>
//         <td>'.$x.'</td>
//         <td>'.$row['username'].'</td>
//         <td>'.$rowAccion['descripcion'].'</td>
//         <td>'.$row['hora'].'</td>
//     </tr>
//     ';
// }

?>

<?php
require('../prcd/conn.php');

// Configuración de paginación
$registrosPorPagina = 10; // Ajusta según necesidad
$paginaActual = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;
$offset = ($paginaActual - 1) * $registrosPorPagina;

// Consulta para obtener el total de registros
$sqlTotal = "SELECT COUNT(*) as total FROM log_users";
$resultadoTotal = $conn->query($sqlTotal);
$totalRegistros = $resultadoTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);

// Consulta principal con paginación
$sql = "SELECT * FROM log_users ORDER BY id DESC LIMIT $offset, $registrosPorPagina";
$resultado = $conn->query($sql);

// Calcular el número inicial basado en la página actual
$x = ($paginaActual - 1) * $registrosPorPagina + 1;

echo '
    <table class="table table-hover text-center table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Usuario</th>
                <th scope="col" class="">Actividad</th>
                <th scope="col">Fecha/Hora</th>
            </tr>
        </thead>
        <tbody>
    ';

while($row = $resultado->fetch_assoc()){
    $accion = $row['accion'];
    $sqlAccion = "SELECT * FROM catalogo_logs WHERE id = '$accion'";
    $resultadoAccion = $conn->query($sqlAccion);
    $rowAccion = $resultadoAccion->fetch_assoc();

    if($accion >= 1 && $accion <= 16){
        $colorActividad = 'text-primary';
    }
    else if($accion >= 17 && $accion <= 32){
        $colorActividad = 'text-warning';
        $colorActividad = 'text-warning';
    }
    else{
        $colorActividad = 'text-success';
    }
    
    echo'
    <tr>
        <td>'.$x.'</td>
        <td><i class="bi bi-person-circle text-primary"></i> '.$row['username'].'</td>
        <td class="text-start"><i class="bi bi-circle '.$colorActividad.'"></i> '.$rowAccion['descripcion'].'</td>
        <td>'.$row['hora'].'</td>
    </tr>
    ';
    $x++;
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
            <a class="page-link paginacion-log" href="#" data-pagina="'.($paginaActual - 1).'" aria-label="Previous">
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
            <a class="page-link paginacion-log" href="#" data-pagina="'.$i.'">'.$i.'</a>
          </li>';
}

// Botón Siguiente
if($paginaActual < $totalPaginas) {
    echo '<li class="page-item">
            <a class="page-link paginacion-log" href="#" data-pagina="'.($paginaActual + 1).'" aria-label="Next">
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