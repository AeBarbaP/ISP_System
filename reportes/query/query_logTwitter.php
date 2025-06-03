<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM log_users ORDER BY id DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    $accion = $row['accion'];
    $sqlAccion = "SELECT * FROM catalogo_logs WHERE id = '$accion'";
    $resultadoAccion = $conn->query($sqlAccion);
    $rowAccion = $resultadoAccion->fetch_assoc();
    echo'

    <div class="tl-item">
        <div class="tl-dot b-warning">
        </div>
            <div class="tl-content">
                <div class="">'.$rowAccion['descripcion'].' | '.$row['username'].'
                </div>
                <div class="tl-date text-muted mt-1">'.$row['hora'].'
                </div>
            </div>
    </div>
    ';
}

?>