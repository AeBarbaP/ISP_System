<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM log_users WHERE DATE(hora) = CURRENT_DATE() ORDER BY id DESC";
$resultado = $conn->query($sql);
$x=0;
while($row = $resultado->fetch_assoc()){

$x++;
    $accion = $row['accion'];
    $sqlAccion = "SELECT * FROM catalogo_logs WHERE id = '$accion'";
    $resultadoAccion = $conn->query($sqlAccion);
    $rowAccion = $resultadoAccion->fetch_assoc();
    
    if ($x == 1){
        $color = 'b-primary';
    }
    elseif ($x == 2){
        $color = 'b-warning';
    }
    elseif ($x == 3){
        $color = 'b-danger';
        $x=0;
    }
    echo'

    <div class="tl-item">
        <div class="tl-dot '.$color.'">
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