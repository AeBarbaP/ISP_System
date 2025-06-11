<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$folioReporte = $_POST['folioReporte'];

$sql = "SELECT * FROM incidencias WHERE estatus = 1 AND folio_incidencia = '$folioReporte' ORDER BY fecha_reporte DESC";
$resultado = $conn->query($sql);
    $x = 0;
    $row = $resultado->fetch_assoc();
    $x++;
    $folio = $row['folio_cliente'];
    $folioIncidencia = $row['folio_incidencia'];
    $tecnico = $row['tecnico'];
    $estatus = $row['estatus'];

    $rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $rowTecnico = $conn->query("SELECT * FROM tecnicos WHERE id = '$tecnico'")->fetch_assoc();

    if($estatus == 1){
        $estatusIncidencia = "Asignado";
    }
    elseif($estatus == 2){
        $estatusIncidencia = "Resuelta";
    }
    elseif($estatus == 3){
        $estatusIncidencia = "Cancelada";
    }

    echo '
    <div class="card" style="width: 100%;">
        <div class="card-header">
            <h5 class="card-title">Folio incidencia</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$folioIncidencia.'</h6>

        </div>
        <div class="card-body">
            <h5 class="card-title">Nombre técnico</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$rowTecnico['nombre'].'</h6>
            <h5 class="card-title">Descripción incidencia:</h5>
            <p class="card-text">'.$row['descripcion'].'</p>
            <h5 class="card-title">Nombre cliente</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$rowCliente['nombre'].'</h6>
            <h5 class="card-title">Fecha reporte</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$row['fecha_reporte'].'</h6>
            <h5 class="card-title">Estatus</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$estatusIncidencia.'</h6>
            
        </div>

        <div class="card-footer">
            <h5 class="card-title">Comentario técnico</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$row['comentario_tecnico'].'</h6>

        </div>
    </div>

    ';

?>