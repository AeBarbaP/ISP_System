<?php
include ("../prcd/conn.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$sql = "SELECT * FROM incidencias WHERE estatus = 1 ORDER BY fecha_reporte DESC";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;
if($filas == 0){
    echo '
    <option value ="0">Selecciona...</option>
    ';
}
else{
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        $folio = $row['folio_cliente'];
        $tecnico = $row['tecnico'];
        $estatus = $row['estatus'];

        $rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
        $rowTecnico = $conn->query("SELECT * FROM tecnicos WHERE id = '$tecnico'")->fetch_assoc();

        if($estatus == 1){
            $estatusIncidencia = "Activa";
        }
        elseif($estatus == 2){
            $estatusIncidencia = "Resuelta";
        }
        elseif($estatus == 3){
            $estatusIncidencia = "Cancelada";
        }

        echo '
        <option value ="'.$row['folio_incidencia'].'">'.$row['folio_incidencia'].' | '.$rowCliente['nombre'].' | '.$rowCliente['comunidad'].'</option>
        ';
    }
}