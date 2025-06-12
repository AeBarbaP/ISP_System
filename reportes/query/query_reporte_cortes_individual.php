<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$folio = $_POST['folio'];

$sql = "SELECT * FROM cortes WHERE estatus = 1 AND folio_corte = '$folio'";
$resultado = $conn->query($sql);
    $x = 0;
    $row = $resultado->fetch_assoc();
    $x++;
    $folio = $row['folio_cliente'];
    $folioCorte = $row['folio_corte'];
    $tecnico = $row['tecnico'];
    $estatus = $row['estatus'];
    $user = $row['username'];

    $rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $rowTecnico = $conn->query("SELECT * FROM tecnicos WHERE id = '$tecnico'")->fetch_assoc();
    $rowUser = $conn->query("SELECT * FROM users WHERE username = '$user'")->fetch_assoc();

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
            <h5 class="card-title">Folio corte</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$folioCorte.'</h6>

        </div>
        <div class="card-body">
            <h5 class="card-title">Nombre técnico</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$rowTecnico['nombre'].'</h6>
            <h5 class="card-title">Capturó:</h5>
            <p class="card-text">'.$rowUser['nombre'].'</p>
            <h5 class="card-title">Nombre cliente</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$rowCliente['nombre'].'</h6>
            <h5 class="card-title">Fecha reporte</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$row['fecha'].'</h6>
            <h5 class="card-title">Estatus</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">'.$estatusIncidencia.'</h6>
            
        </div>

        <div class="card-footer">
            <h5 class="card-title">Comentario técnico</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">S/C</h6>

        </div>
    </div>

    ';

?>