<?php
session_start();
include ("../prcd/qc/qc.php");

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

$mes = date('m', strtotime($fecha_actual));
$annio =  date('Y', strtotime($fecha_actual));

$credencial = 0;
$tarjeton = 0;
$expediente = 0;

$meses = 12;

for ($meses = 1; $meses <= 12; $meses++) {
    
    $sqlUsers = "SELECT * FROM users ORDER BY id ASC";
    $resultadoUsers = $conn->query($sqlUsers);
    while($rowUsers = $resultadoUsers->fetch_assoc()){

        $user = $rowUsers['username'];
        $sqlExpedientesCompletos = "SELECT * FROM log_registro WHERE usr = '$user' AND MONTH(fecha) = $meses";
        $resultadoExpCompletos = $conn->query($sqlExpedientesCompletos);
        while($rowExp = $resultadoExpCompletos->fetch_assoc()){
            $tipoDato = $rowExp['tipo_dato'];
            if($tipoDato == 37){
                $credencial++;
            }
            elseif($tipoDato == 38){
                $tarjeton++;
            }
            elseif($tipoDato == 39){
                $expediente++;
            }
        }
        
    }
    $datos[] = array(
                'mes' => $meses,
                'credencial' => $credencial,
                'tarjeton' => $tarjeton,
                'expediente' => $expediente
        );

} //for meses 12

echo json_encode($datos);

// echo var_dump($datos);

?>