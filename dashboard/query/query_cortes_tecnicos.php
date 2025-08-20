<?php
session_start();
require('../prcd/conn.php');

$usuario = $_SESSION['username'];

echo '
<div class="accordion accordion-flush" id="accordionFlushExampleCorte">';
$x = 0;
$sql = "SELECT * FROM cortes WHERE estatus = 0";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $x++;
    $id = $row['id'];
    $folio = $row['folio_cliente'];
    $fecha = $row['fecha'];
    $descripcion = "NA";
    $estatus = $row['estatus'];
    $tecnico = $row['tecnico'];
    $fecha = $row['fecha'];
    
    // Obtener datos del cliente
    $cliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    $nombre = $cliente['nombre'];
    $telefono = $cliente['telefono'];
    $comunidad = $cliente['comunidad'];
    $direccion = $cliente['domicilio'];

    // Formatear fecha
    $fecha_formateada = date('d-m-Y', strtotime($fecha));

    echo '
    <div class="accordion-item border rounded-1">
        <h2 class="accordion-header" id="flush-heading2'.$x.'">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse2'.$x.'" aria-expanded="false" aria-controls="flush-collapse2'.$x.'">
                <i class="bi bi-person-circle me-1"></i> '.$nombre.'
            </button>
        </h2>
        <div id="flush-collapse2'.$x.'" class="accordion-collapse collapse" aria-labelledby="flush-heading2'.$x.'" data-bs-parent="#accordionFlushExampleCorte">
            <div class="accordion-body">
                <strong>Teléfono:</strong> '.$telefono.'<br>
                <strong>Dirección:</strong> '.$direccion.'<br>
                <strong>Comunidad:</strong> '.$comunidad.'<br>
                <strong>Descripción:</strong> '.$descripcion.'
            </div>
            <div class="accordion-footer text-end p-3">
                <button class="btn btn-primary" onclick="modalCortesTecnico('.$id.')"><i class="bi bi-calendar-check"></i> Cerrar ticket</button>
            </div>
        </div>
    </div>
    ';
}

echo '
</div>';
?>