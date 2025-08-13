<?php
/* session_start(); */
/* $usr = $_SESSION['nombre']; */

/* include('qc/qc.php'); */
require('pdf/fpdf/fpdf.php');
/* 
date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8'); */

/* $fecha_actual = strftime("%d-%m-%Y");

$curp =$_REQUEST['curp'];

$sqlGenerales = "SELECT * FROM datos_generales WHERE curp = '$curp'";
$resultadoGenerales = $conn->query($sqlGenerales);
$rowSqlGenerales = $resultadoGenerales->fetch_assoc();

$estado = $rowSqlGenerales['estado'];
$expediente = $rowSqlGenerales['numExpediente'];

$sqlEstados = "SELECT * FROM catestados WHERE claveEstado = '$estado'";
$resultadoEstados = $conn->query($sqlEstados);
$rowSqlEstados = $resultadoEstados->fetch_assoc();

$municipio = $rowSqlGenerales['municipio'];

$sqlMunicipios = "SELECT * FROM catmunicipios WHERE claveMunicipio = '$municipio'";
$resultadoMunicipios = $conn->query($sqlMunicipios);
$rowSqlMunicipios = $resultadoMunicipios->fetch_assoc();


$sqlMedicos = "SELECT * FROM datos_medicos WHERE curp = '$curp'";
$resultadoMedicos = $conn->query($sqlMedicos);
$rowSqlMedicos = $resultadoMedicos->fetch_assoc();

$sqlVivienda = "SELECT * FROM vivienda WHERE curp = '$curp'";
$resultadoVivienda = $conn->query($sqlVivienda);
$rowSqlVivienda = $resultadoVivienda->fetch_assoc();

$sqlFam = "SELECT * FROM integracion WHERE curp = '$curp'";
$resultadoFam = $conn->query($sqlFam);
$rowSqlFam = $resultadoFam->fetch_assoc();

$sqlRef = "SELECT * FROM referencias WHERE expediente = '$expediente'";
$resultadoRef = $conn->query($sqlRef);
$rowSqlRef = $resultadoRef->fetch_assoc();

$sqlServicios = "SELECT * FROM servicios WHERE curp = '$curp'";
$resultadoServicios = $conn->query($sqlServicios);
$rowSqlServicios = $resultadoServicios->fetch_assoc();

$genero = $rowSqlGenerales['genero'];

$estadoCivil = $rowSqlGenerales['edo_civil'];
if ($estadoCivil == 1){
  $regEdoCivil = "Solter@";
}
else if ($estadoCivil == 2){
  $regEdoCivil = "Casad@";
}
else if ($estadoCivil == 3){
  $regEdoCivil = "Divorciad@";
}
else if ($estadoCivil == 4){
  $regEdoCivil = "Viud@";
}

$regEscolaridad = $rowSqlGenerales['escolaridad'];
if ($regEscolaridad == 1){
  $regEscolaridad = "Sin escolarizar";
}
else if ($regEscolaridad == 2){
  $regEscolaridad = "Primaria";
}
else if ($regEscolaridad == 3){
  $regEscolaridad = "Secundaria";
}
else if ($regEscolaridad == 4){
  $regEscolaridad = "Preparatoria";
}
else if ($regEscolaridad == 5){
  $regEscolaridad = "Licenciatura";
}
else if ($regEscolaridad == 6){
  $regEscolaridad = "Posgrado";
}

$check = "4";

$leer_escribir = $rowSqlGenerales['leer_escribir'];
if ($leer_escribir == 1){
  $leerSi = $check;
  $leerNo = "";
}
else if ($leer_escribir == 0){
  $leerSi = "";
  $leerNo = $check; 
}

$nivelConcluido = $rowSqlGenerales['nivel_concluido'];
if ($nivelConcluido == 1){
  $concluidaSi = $check;
  $concluidaNo = "";
  $concluidaCur = "";
  $concluidaNA = "";
}
else if ($nivelConcluido == 0){
  $concluidaSi = "";
  $concluidaNo = $check;
  $concluidaCur = "";
  $concluidaNA = "";
}
else if ($nivelConcluido == 2){
  $concluidaSi = "";
  $concluidaNo = "";
  $concluidaNA = $check;
  $concluidaCur = "";
}
else if ($nivelConcluido == 3){
  $concluidaSi = "";
  $concluidaNo = "";
  $concluidaNA = "";
  $concluidaCur = $check;
}

$estudia = $rowSqlGenerales['estudia'];
if ($estudia == 0){
  $regEstudiaNo = $check;
  $regEstudiaSi = "";
}
else if ($estudia == 1){
  $regEstudiaNo = "";
  $regEstudiaSi = $check;
}

$trabaja = $rowSqlGenerales['trabaja'];
if ($trabaja == 0){
  $regTrabajaNo = $check;
  $regTrabajaSi = "";
}
else if ($trabaja == 1){
  $regTrabajaNo = "";
  $regTrabajaSi = $check;
}

$ac = $rowSqlGenerales['asoc_civ'];
if ($ac == 0){
  $regACNo = $check;
  $regACSi = "";
}
else if ($ac == 1){
  $regACNo = "";
  $regACSi = $check;
}
$frecuencia = "";
$montoPensionBD = $rowSqlGenerales['pension_monto'];
$montoPension = "";
$pension = $rowSqlGenerales['pensionado'];
if ($pension == 0){
  $regPensionNo = $check;
  $regPensionSi = "";
}
else if ($pension == 1){
  $regPensionNo = "";
  $regPensionSi = $check;
  $frecuenciaP = $rowSqlGenerales['pension_temporalidad'];
  if ($frecuenciaP == 1){
    $frecuencia = "Mensual";
  }
  else if ($frecuenciaP == 2){
    $frecuencia = "Bimestral";
  }
  else if ($frecuenciaP == 3){
    $frecuencia = "Trimestral";
  }
  else if ($frecuenciaP == 4){
    $frecuencia = "Cuatrimestral";
  }
  else if ($frecuenciaP == 5){
    $frecuencia = "Semestral";
  }
  if ($montoPensionBD == null || $montoPensionBD == "" || $montoPensionBD == 0){
    $montoPension = "";
  }
  else{
    $montoPension = $montoPensionBD.'.00';
  }
}

$ss = $rowSqlGenerales['seguridad_social'];
if ($ss == 'IMSS'){
  $regIMSS = $check;
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = "";
  $regOtro = "";
}
else if ($ss == 'ISSSTE'){
  $regIMSS = "";
  $regISSSTE = $check;
  $regSSZ = "";
  $regNon = "";
  $regOtro = "";
}
else if ($ss == 'SSZ'){
  $regIMSS = "";
  $regISSSTE = "";
  $regSSZ = $check;
  $regNon = "";
  $regOtro = "";
}
else if ($ss == 5){
  $regIMSS = "";
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = "";
  $regOtro = $check;
}
else{
  $regIMSS = "";
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = $check;
  $regOtro = "";
}

$discapacidad = $rowSqlMedicos['tipo_discapacidad'];
if ($discapacidad == 'Física'){
  $regFisica = $check;
  $regIntelectual = "";
  $regSensorial = "";
  $regMultiple = "";
  $regPsicosocial = "";
}
else if ($discapacidad == 'Intelectual'){
  $regFisica = "";
  $regIntelectual = $check;
  $regSensorial = "";
  $regMultiple = "";
  $regPsicosocial = "";
}
else if ($discapacidad == 'Sensorial'){
  $regFisica = "";
  $regIntelectual = "";
  $regSensorial = $check;
  $regMultiple = "";
  $regPsicosocial = "";
}
else if ($discapacidad == 'Múltiple'){
  $regFisica = "";
  $regIntelectual = "";
  $regSensorial = "";
  $regMultiple = $check;
  $regPsicosocial = "";
}
else if ($discapacidad == 'Psicosocial'){
  $regFisica = "";
  $regIntelectual = "";
  $regSensorial = "";
  $regMultiple = "";
  $regPsicosocial = $check;
}

$nacimiento = '';
$congenita = "";
$genetica = "";
$hereditaria = "";
$enfermedad = "";
$accidente = "";
$violencia = "";
$adiccion = "";
$otra = "";
$desconoce = "";
$espedifique = "";

$idDiscapacidad = $rowSqlMedicos['discapacidad'];
$causa = $rowSqlMedicos['causa'];
//aquí poner if para las causas en texto
if ($causa == 1){
  $nacimiento = $check;
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = "";
  $adiccion = "";
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if ($causa == 2){ 
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = $check;
  $violencia = "";
  $adiccion = "";
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if ($causa == 3){
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = $check;
  $accidente = "";
  $violencia = "";
  $adiccion = "";
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if($causa == 4){
  $nacimiento = "";
  $congenita = $check;
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = "";
  $adiccion = "";
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if ($causa == 5){
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = "";
  $adiccion = "";
  $otra = $check;
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if($causa == 6){
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = "";
  $adiccion = "";
  $otra = "";
  $desconoce = $check;
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if($causa == 7){
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = $check;
  $adiccion = "";
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}
else if($causa == 8){
  $nacimiento = "";
  $congenita = "";
  $genetica = "";
  $hereditaria = "";
  $enfermedad = "";
  $accidente = "";
  $violencia = "";
  $adiccion = $check;
  $otra = "";
  $desconoce = "";
  $espedifique = $rowSqlMedicos['causa_otro'];
}

$braile = $rowSqlMedicos['braile'];
if ($braile == 1) {
  $braileSi = $check;
  $braileNo = "";
  $braileNA = "";
}
else if ($braile == 2) {
  $braileSi = "";
  $braileNo = $check;
  $braileNA = "";
}
else if ($braile == 0) {
  $braileSi = "";
  $braileNo = "";
  $braileNA = $check;
}
else {
  $braileSi = "";
  $braileNo = "";
  $braileNA = "";
}

$lsm = $rowSqlMedicos['lsm'];
if ($lsm == 1) {
  $lsmSi = $check;
  $lsmNo = "";
  $lsmNA = "";
}
else if ($lsm == 2) {
  $lsmSi = "";
  $lsmNo = $check;
  $lsmNA = "";
}
else if ($lsm == 0) {
  $lsmSi = "";
  $lsmNo = "";
  $lsmNA = $check;
}
else {
  $lsmSi = "";
  $lsmNo = "";
  $lsmNA = "";
}

$labiofacial = $rowSqlMedicos['labiofacial'];
if ($labiofacial == 1) {
  $labiofacialSi = $check;
  $labiofacialNo = "";
  $labiofacialNA = "";
}
else if ($labiofacial == 2) {
  $labiofacialSi = "";
  $labiofacialNo = $check;
  $labiofacialNA = "";
}
else if ($labiofacial == 0) {
  $labiofacialSi = "";
  $labiofacialNo = "";
  $labiofacialNA = $check;
}
else {
  $labiofacialSi = "";
  $labiofacialNo = "";
  $labiofacialNA = "";
}


$idTemporalidad = $rowSqlMedicos['temporalidad'];
if($idTemporalidad == null || $idTemporalidad == "0000-00-00" || $idTemporalidad == ""){
  $tempDisc ="";
}
else{
  $tempDisc = $rowSqlMedicos['temporalidad'];
}

$idFValoracion = $rowSqlMedicos['valoracion'];
if($idFValoracion == 1 || $idFValoracion == 'IMSS'){
  $idFValoracion2 ="IMSS";
}
else if($idFValoracion == 2 || $idFValoracion == 'ISSSTE'){
  $idFValoracion2 ="ISSSTE";
}
else if($idFValoracion == 3 || $idFValoracion == 'SSZ'){
  $idFValoracion2 ="SSZ";
}
else if($idFValoracion == 4 || $idFValoracion == 'CREE'){
  $idFValoracion2 ="CREE";
}
else if($idFValoracion == 5 || $idFValoracion == 'SMFA'){
  $idFValoracion2 ="SMFA";
}
else if($idFValoracion == 6 || $idFValoracion == 'UBR'){
  $idFValoracion2 ="UBR";
}
else{
  $idFValoracion2 = "";
}

$idSangre = $rowSqlMedicos['tipo_sangre'];
if($idSangre == 1){
  $idSangre2 ="A Rh +";
}
else if($idSangre == 2){
  $idSangre2 ="A Rh -";
}
else if($idSangre == 3){
  $idSangre2 ="AB Rh +";
}
else if($idSangre == 4){
  $idSangre2 ="AB Rh -";
}
else if($idSangre == 5){
  $idSangre2 ="B Rh +";
}
else if($idSangre == 6){
  $idSangre2 ="B Rh -";
}
else if($idSangre == 7){
  $idSangre2 ="O Rh +";
}
else if($idSangre == 8){
  $idSangre2 ="O Rh -";
}

$idRehab = $rowSqlMedicos['rehabilitacion'];
if($idRehab == 1){
  $idRehab2 =$check;
  $idRehab3 ="";
}
else if($idRehab == 0){
  $idRehab2 = "";
  $idRehab3 = $check;
}
else{
  $idRehab2 = "";
  $idRehab3 = "";
}
$rehabDonde1 = $rowSqlMedicos['rehabilitacion_donde'];
if ($rehabDonde1 == "" || $rehabDonde1 == "0"){
  $rehabDonde = "";
}
else {
  $rehabDonde = $rehabDonde1;
}
$rehabInicio = $rowSqlMedicos['rehabilitacion_inicio'];
if ($rehabInicio == "" || $rehabInicio == "0000-00-00" || $rehabInicio == null){
  $rehabInicio1 = "";
}
else {
  $rehabInicio1 = $rehabInicio;
}


$Duracion = $rowSqlMedicos['rehabilitacion_duracion'];
if($Duracion == 1){
  $Duracion2 ="0-6 meses";
}
else if($Duracion == 2){
  $Duracion2 = "7-12 meses";
}
else if($Duracion == 3){
  $Duracion2 = "13-18 meses";
}
else if($Duracion == 4){
  $Duracion2 = "18 meses o más";
}
else{
  $Duracion2 = "";
}

$idCirugias = $rowSqlMedicos['cirugias'];
if($idCirugias == 1 || $idCirugias == "SI"){
  $idCirugias2 =$check;
  $idCirugias3 ="";
}
else if($idCirugias == 2 || $idCirugias == "NO"){
  $idCirugias2 = "";
  $idCirugias3 = $check;
}
else{
  $idCirugias2 = "";
  $idCirugias3 = "";
}

$protesis = $rowSqlMedicos['protesis'];
if($protesis == 1 || $protesis == "SI"){
  $protesis2 =$check;
  $protesis3 ="";
}
else if($protesis == 2 || $protesis == "NO"){
  $protesis2 = "";
  $protesis3 = $check;
}
else{
  $protesis2 = "";
  $protesis3 = "";
}

$seguridadS = $rowSqlGenerales['seguridad_social'];
if ($seguridadS == "IMSS" || $seguridadS == "imss"){
  $regImss = $check;
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = "";
  $regOtro = "";
}
else if ($seguridadS == "ISSSTE" || $seguridadS == "issste"){
  $regImss = "";
  $regISSSTE = $check;
  $regSSZ = "";
  $regNon = "";
  $regOtro = "";
}
else if ($seguridadS == "SSZ" || $seguridadS == "ssz"){
  $regImss = "";
  $regISSSTE = "";
  $regSSZ = $check;
  $regNon = "";
  $regOtro = "";
}
else if ($seguridadS == "NON" || $seguridadS == "non"){
  $regImss = "";
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = $check;
  $regOtro = "";
}
else if ($seguridadS == "OTRO" || $seguridadS == "Otro"){
  $regImss = "";
  $regISSSTE = "";
  $regSSZ = "";
  $regNon = "";
  $regOtro = $rowSqlGenerales['seguridad_social_otro'];
}

$ingresoMensualVal = $rowSqlGenerales['trabaja_ingresos'];
if ($ingresoMensualVal == 1) {
  $ingresoMensual = 'Menor a 4,500';
}
else if ($ingresoMensualVal == 2) {
  $ingresoMensual = '4,501 - 12,500';
}
else if ($ingresoMensualVal == 3) {
  $ingresoMensual = '12,501 - $19,500';
}
else if ($ingresoMensualVal == 4){
  $ingresoMensual = '$19,501 - $24,999';
}
else if ($ingresoMensualVal == 5){
  $ingresoMensual = 'Mayor de $25,000';
}
else {
  $ingresoMensual = "";
}

$vulnerables = $rowSqlGenerales['gpo_vulnerable'];
if ($vulnerables == "" || $vulnerables == null){
  $vulnerablesNo =$check;
  $vulnerablesSi ="";
  $gruposVulnerables = "";
}
else {
  $vulnerablesNo = "";
  $vulnerablesSi = $check;
  $gruposVulnerables = $vulnerables;
}

$supervision = $rowSqlMedicos['asistencia'];
if ($supervision == 1){
  $asistenciaT = $check;
  $asistenciaE = "";
  $asistenciaN = "";
}
else if ($supervision == 2){
  $asistenciaT = "";
  $asistenciaE = $check;
  $asistenciaN = "";
}
else if ($supervision == 3){
  $asistenciaT = "";
  $asistenciaE = "";
  $asistenciaN = $check;
}
else {
  $asistenciaT = "";
  $asistenciaE = "";
  $asistenciaN = "";
}

$duracionAsistencia = $rowSqlMedicos['tiempo_asistencia'];
if ($duracionAsistencia == 1){
  $permanenteSi = $check;
  $permanenteNo = "";
  $permanenteNA = "";
}
else if($duracionAsistencia == 2){
  $permanenteSi = "";
  $permanenteNo = $check;
  $permanenteNA = "";
}
else if($duracionAsistencia == 3){
  $permanenteSi = "";
  $permanenteNo = "";
  $permanenteNA = $check;
}
else {
  $permanenteSi = "";
  $permanenteNo = "";
  $permanenteNA = "";
}

$sqlViviendas = "SELECT * FROM vivienda WHERE curp = '$curp'";
$resultadoViv = $conn->query($sqlViviendas);
$rowViviendas = $resultadoViv->fetch_assoc();

$viviendas = $rowViviendas['vivienda'];
if($viviendas == 1){
  $propia =$check;
  $prestada ="";
  $rentada ="";
}
else if($viviendas == 2){
  $propia ="";
  $prestada =$check;
  $rentada ="";
}
else if($viviendas == 3){
  $propia ="";
  $prestada ="";
  $rentada =$check;
}
else {
  $propia ="";
  $prestada ="";
  $rentada ="";
}

$propietario = $rowSqlVivienda['propietario'];
if ($propietario == 1) {
  $propietarioSi =$check;
  $propietarioNo ="";
}
else if ($propietario == 0){
  $propietarioSi ="";
  $propietarioNo =$check;
}
else {
  $propietarioSi ="";
  $propietarioNo ="";
}

$viviendaRentaMXN = $rowViviendas['vivienda_renta'];
if ($viviendaRentaMXN == "" || $viviendaRentaMXN == null || $viviendaRentaMXN == 0){
  $viviendaRentaMXN1 = "";
}
else{
  $viviendaRentaMXN1 = $viviendaRentaMXN;
}

$pagandoViv = $rowViviendas['vivienda_pagando'];
if($pagandoViv == 1){
  $pagandoSi =$check;
  $pagandoNo ="";
}
else if($pagandoViv == 0){
  $pagandoSi ="";
  $pagandoNo =$check;
}
$montoPagando = $rowViviendas['monto_pagando'];
if ($montoPagando == 0 || $montoPagando == null || $montoPagando == ""){
  $montoPagando1 = "";
}
else{
  $montoPagando1 = $montoPagando;
}

$tipoCasa = $rowViviendas['caracteristicas'];
if($tipoCasa == 1){
  $casa =$check;
  $departamento ="";
  $vecindad ="";
  $otroCasa ="";
}
else if($tipoCasa == 2){
  $casa = "";
  $departamento = $check;
  $vecindad ="";
  $otroCasa = "";
}
else if($tipoCasa == 3){
  $casa ="";
  $departamento ="";
  $vecindad =$check;
  $otroCasa ="";
}
else if($tipoCasa == 4){
  $casa ="";
  $departamento ="";
  $vecindad ="";
  $otroCasa = $rowViviendas['caracteristicas_otro'];
}
else {
  $casa ="";
  $departamento ="";
  $vecindad ="";
  $otroCasa ="";
}

$cocina = $rowViviendas['vivienda_cocia'];
if ($cocina == 1){
  $cocinaCheck = $check;
}
else {
  $cocinaCheck ="";
}

$sala = $rowViviendas['vivienda_sala'];
if ($sala == 1){
  $salaCheck = $check;
}
else {
  $salaCheck ="";
}

$banio = $rowViviendas['vivienda_banio'];
if ($banio == 1){
  $banioCheck = $check;
  $numBanios = $rowViviendas['num_banio'];
}
else {
  $banioCheck ="";
  $numBanios = "";
}
$localizacion = $rowViviendas['localizacion'];
if ($localizacion == 1){
  $interior = $check;
  $exterior = "";
}
else if ($localizacion == 2){
  $interior = "";
  $exterior = $check;
}
else {
  $interior = "";
  $exterior = "";
}

$otroHab = $rowViviendas['vivienda_otros'];
if ($otroHab == 0 || $otroHab == null || $otroHab == ""){
  $otroHabCheck = "";
}
else {
  $otroHabCheck = $otroHab;
}

$techo = $rowViviendas['techo'];
if ($techo == 1){
  $cemento = "";
  $lamina = $check;
  $otroTecho = "";
}
else if ($techo == 2) {
  $cemento = $check;
  $lamina = "";
  $otroTecho = "";
}
else if ($techo == 3) {
  $lamina = "";
  $cemento = "";
  $otroTecho = $rowViviendas['techo_otro'];
}


$pared  = $rowViviendas['pared'];
if ($pared == 1){
  $block = $check;
  $ladrillo = "";
  $adobe = "";
  $otroPared = "";
  $paredOtroVal = "";
}
else if ($pared == 2){
  $block = "";
  $ladrillo = $check;
  $adobe = "";
  $otroPared = "";
  $paredOtroVal = "";
}
else if ($pared == 3){
  $block = "";
  $ladrillo = "";
  $adobe = $check;
  $otroPared = "";
  $paredOtroVal = "";
}
else if ($pared == 4){
  $block = "";
  $ladrillo = "";
  $adobe = "";
  $otroPared = $rowViviendas['pared_otro'];
}

$serviciosAgua = $rowViviendas['serv_basicos_agua'];
if ($serviciosAgua == 1){
  $agua = $check;
}
else {
  $agua ="";
}

$serviciosLuz = $rowViviendas['serv_basicos_luz'];
if ($serviciosLuz == 1){
  $luz = $check;
}
else {
  $luz ="";
}

$serviciosDrenaje = $rowViviendas['serv_basicos_drenaje'];
if ($serviciosDrenaje == 1){
  $drenaje = $check;
}
else {
  $drenaje ="";
}

$serviciosInternet = $rowViviendas['serv_basicos_internet'];
if ($serviciosInternet == 1){
  $internet = $check;
}
else {
  $internet ="";
}

$serviciosCel = $rowViviendas['serv_basicos_celular'];
if ($serviciosCel == 1){
  $celularServ = $check;
}
else {
  $celularServ ="";
}

$serviciosCar = $rowViviendas['serv_basicos_carro'];
if ($serviciosCar == 1){
  $carro = $check;
}
else {
  $carro ="";
}

$serviciosGas = $rowViviendas['serv_basicos_gas'];
if ($serviciosGas == 1){
  $gas = $check;
}
else {
  $gas ="";
}

$serviciosTel = $rowViviendas['serv_basicos_telefono'];
if ($serviciosTel == 1){
  $telefonoServ = $check;
}
else {
  $telefonoServ ="";
}

$serviciosOtro = $rowViviendas['serv_basicos_otro'];
if ($serviciosOtro == 1){
  $otroServ = $serviciosOtro;
}
else if ($serviciosOtro == 0 || $serviciosOtro == null || $serviciosOtro == "") {
  $otroServ = "";
}

$electroLavadora = $rowViviendas['electrodomesticos_lavadora'];
if ($electroLavadora == 1){
  $lavadora = $check;
}
else {
  $lavadora = "";
}

$electroDispositivo = $rowViviendas['electrodomesticos_dispositivo'];
if ($electroDispositivo == 1){
  $dispositivo = $check;
}
else {
  $dispositivo = "";
}

$electroMicroondas = $rowViviendas['electrodomesticos_microondas'];
if ($electroMicroondas == 1){
  $microondas = $check;
}
else {
  $microondas = "";
}

$electroTV = $rowViviendas['electrodomesticos_tv'];
if ($electroTV == 1){
  $tv = $check;
}
else {
  $tv = "";
}

$electroCompu = $rowViviendas['electrodomesticos_computadora'];
if ($electroCompu == 1){
  $computadora = $check;
}
else {
  $computadora = "";
}

$electroLicuadora = $rowViviendas['electrodomesticos_licuadora'];
if ($electroLicuadora == 1){
  $licuadora = $check;
}
else {
  $licuadora = "";
}

$electroEstufa = $rowViviendas['electrodomesticos_estufa'];
if ($electroEstufa == 1){
  $estufa = $check;
}
else {
  $estufa = "";
}

$electroRefri = $rowViviendas['electrodomesticos_refri'];
if ($electroRefri == 1){
  $refri = $check;
}
else {
  $refri = "";
}

$electroOtro = $rowViviendas['electrodomesticos_otro'];
if ($electroOtro == 1){
  $otroElectro = $electroOtro;
}
else if ($electroOtro == 0 || $electroOtro == "" || $electroOtro == null){
  $otroElectro = "";
}

$dependienteEco = $rowViviendas['dependiente'];
if ($dependienteEco == 1){
  $dependienteSi = $check;
  $dependienteNo = "";
  $financiador = $rowViviendas['financiador'];
}
else if ($dependienteEco == 0){
  $dependienteSi = "";
  $dependienteNo = $check;
  $financiador = "";
}
else {
  $dependienteSi = "";
  $dependienteNo = "";
  $financiador = "";
}

$dependen = $rowViviendas['personas_dependen'];
if ($dependen > 1){
  $personasDep = ' '.$dependen.' ';
}
else {
  $personasDep = 0;

}

$informante = $rowSqlGenerales['informante'];

if ($informante == "" || $informante == null || $informante = 0){
  $autoriza = $rowSqlGenerales['nombre'].' '.$rowSqlGenerales['apellido_p'].' '.$rowSqlGenerales['apellido_m'];
}
else {
  $autoriza = $rowSqlGenerales['informante'];
} */

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('../../images/logo_conectwi_wide-removebg-preview.png',10,10,80);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(30,10,'',0,0,'C');
    // Salto de línea
    $this->Ln(20);
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-35);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página

    $this->Ln();
    $this->Ln();
    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'R');
    $this->Ln(7);
    $this->SetFont('Arial','B',8);
    $this->Cell(0,4,utf8_decode('Mariano Matamoros S/N, Colonia Centro'),0,0,'R');
    $this->Ln();
    $this->Cell(0,4,utf8_decode('Genaro Codina, Zacatecas, Zac.'),0,0,'R');
    $this->Ln();
    $this->Cell(0,4,utf8_decode('contacto@conectwi.com  Tel. 492-942-7478'),0,0,'R');
}
}

// Creación del objeto de la clase heredada
$pdf = new PDF('P','mm','Letter');
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);
$pdf->Multicell(190,8,utf8_decode('RECIBO DE PAGO'),0,'C',0);
$pdf->Ln(5);

$pdf->SetFont('Arial','B',9);
$pdf->Cell(40,5,utf8_decode('FOLIO DE PAGO: '),0,0,'R');
$pdf->Cell(3,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',10);
$pdf->Cell(44,5,utf8_decode(''),1,0,'C');
$pdf->Cell(5,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',9);
$pdf->Cell(40,5,utf8_decode('FECHA:'),0,0,'R');
$pdf->Cell(5,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',10);
$pdf->Cell(40,5,utf8_decode(''),1,0,'C');
$pdf->Cell(4,5,utf8_decode(''),0,0,'C');
$pdf->Ln();
$pdf->Ln();

//$pdf->SetLineWidth(0.5);
//$pdf->Line(10, 47, 211-10, 47); // 20mm from each edge
//$pdf->SetLineWidth(0.2);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(130,5,utf8_decode('DATOS DEL CLIENTE'),1,0,'L');
/* $pdf->Line(10, 53, 210-10, 53); // 20mm from each edge */

$pdf->Cell(60,5,utf8_decode('NO. CLIENTE'),1,0,'C',false);
$pdf->Ln();
$pdf->Cell(120,5,utf8_decode(''),'L',0,'L');
$pdf->Cell(10,5,utf8_decode(''),'R',0,'C');
$pdf->Cell(60,5,utf8_decode(''),'R',0,'C',false);
$pdf->Ln();
$pdf->SetFont('Arial','B',10);
$pdf->Cell(120,5,utf8_decode('Ana Elisa Barba Pinedo'),'L',0,'L');
$pdf->Cell(10,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(60,5,utf8_decode('#'),'LR',0,'C',false);
$pdf->Ln();
$pdf->SetFont('Arial','B',8);
$pdf->Cell(120,5,utf8_decode('Calle de la Colina 218, Loma Bonita'),'L',0,'L');
$pdf->Cell(10,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(60,5,utf8_decode('PERIODO'),1,0,'C',false);
$pdf->Ln();
$pdf->SetFont('Arial','B',8);
$pdf->Cell(120,5,utf8_decode('Zacatecas, Zac.'),'L',0,'L');
$pdf->Cell(10,5,utf8_decode(''),'R',0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(60,5,utf8_decode(''),'R',0,'C',false);
$pdf->Ln();
$pdf->Cell(130,5,utf8_decode(''),'LRB',0,'L');
$pdf->Cell(60,5,utf8_decode(''),'RB',0,'L');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','B',8);
//$pdf->Cell(10,5,utf8_decode('Género:'),0,0,'L');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','',10);
//$pdf->Cell(22,5,utf8_decode(' '),'B',0,'C');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','B',8);
//$pdf->Cell(10,5,utf8_decode('Edad:'),0,0,'L');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','',10);
//$pdf->Cell(10,5,utf8_decode(' '),'B',0,'C');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','B',8);
//$pdf->Cell(20,5,utf8_decode('Estado Civil:'),0,0,'L');
//$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
//$pdf->SetFont('Arial','',10);
//$pdf->Cell(28,5,utf8_decode(''),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(32,5,utf8_decode('Fecha de nacimiento:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(24,5,utf8_decode(''),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(37,5,utf8_decode('Lugar de nacimiento:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'L');
$pdf->SetFont('Arial','',10);
$pdf->Cell(95,5,utf8_decode(''),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('CURP:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(43,5,utf8_decode(' '),0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(9,5,utf8_decode('RFC:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(30,5,utf8_decode('  '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(20,5,utf8_decode('Tel.Contacto:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(22,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(23,5,utf8_decode('Tel.Emergencia:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(25,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Domicilio:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(105,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(2,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('No. Ext:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(18,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('No. Int.:'),0,0,'R');
$pdf->Cell(1,6,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(18,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Colonia:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(75,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(26,5,utf8_decode('Entre vialidades:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'L');
$pdf->SetFont('Arial','',10);
$pdf->Cell(72,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(50,5,utf8_decode('Descripción o referencia del lugar:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(140,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Estado:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(30,5,utf8_decode('  '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Municipio:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(55,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Localidad:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(54,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(22,5,utf8_decode('Asentamiento:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(59,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('C.P:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(18,5,utf8_decode('  '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Correo-e:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(60,5,utf8_decode('  '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Sabe Leer?'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Estudia:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Dónde?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(44,5,utf8_decode(' '),'B',0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Habilidad:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(35,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(26,5,utf8_decode('Nivel escolaridad:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(38,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Concluída:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Trunca:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Cursando:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('No Aplica:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Trabaja:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Dónde?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(38,5,utf8_decode('  '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(28,5,utf8_decode('Ingreso mensual: $'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(23,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(24,5,utf8_decode('Profesión/Oficio:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(23,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(34,5,utf8_decode('Pertenece a alguna AC:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Cuál?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(118,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(32,5,utf8_decode('Pensión, Beca o Apoyo:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(5,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(5,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Dónde?'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(38,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(22,5,utf8_decode('Monto pensión: $ '),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(20,5,utf8_decode(''),'B',0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Cell(17,5,utf8_decode('Frecuencia:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(22,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(38,5,utf8_decode('Tipo de Seguridad Social:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('IMSS:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('ISSSTE:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(8,5,utf8_decode('SSZ:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Ninguno:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Otro:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(32,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('No. de SS:'),0,0,'R');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(20,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(48,5,utf8_decode('Pertenece a otro Grupo Vulnerable:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Cuál(es)?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(104,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->Ln();

$pdf->SetLineWidth(0.5);
$pdf->Line(10, 132, 211-10, 132); // 20mm from each edge
$pdf->SetLineWidth(0.2);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(191,5,utf8_decode('DATOS MÉDICOS'),0,0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(20,5,utf8_decode(''),0,0,'C');
$pdf->Cell(32,5,utf8_decode('Tipo de discapacidad:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Física:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' ' ),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Intelectual:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Sensorial:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Múltiple:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Psicosocial:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(21,5,utf8_decode('Discapacidad:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(50,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Grado:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(25,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Describa:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(64,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();
$pdf->Ln(1);

$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Usa Braile:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para braileSi
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para braileNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(8,5,utf8_decode('N/A:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para braileNA
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Sabe LSM?:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para lsmSi
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para lsmNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(8,5,utf8_decode('N/A:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para lsmNA
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(37,5,utf8_decode('Sabe Lectura Labiofacial?:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para labiofacialSi
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para labiofacialNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(8,5,utf8_decode('N/A:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para labiofacialNA
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();
$pdf->Ln(1);

$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Causa:'),0,0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Nacimiento:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Congénita:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Genética:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Hereditaria:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(19,5,utf8_decode('Enfermedad:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Accidente:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Violencia:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Adicción:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(35,5,utf8_decode(''),0,0,'C');
$pdf->Cell(9,5,utf8_decode('Otra:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Desconoce:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Especifique:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Cell(50,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(34,5,utf8_decode('Fecha inicio discapacidad :'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(28,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(34,5,utf8_decode('Fuente de Valoración:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(31,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(32,5,utf8_decode('Fecha de Valoración:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(27,5,utf8_decode(' '),'B',0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(25,5,utf8_decode('Rehabilitación:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Dónde?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(29,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(23,5,utf8_decode('Fecha de Inicio:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(22,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(18,5,utf8_decode('Duración:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(30,5,utf8_decode(' '),'B',0,'C');
$pdf->Ln();
$pdf->Ln(1);

$pdf->SetFont('Arial','B',8);
$pdf->Cell(24,5,utf8_decode('Tipo de Sangre:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(15,5,utf8_decode(' '),'B',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(25,5,utf8_decode('Tiene cirugías?:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(28,5,utf8_decode('Tipo de cirugía:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(71,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(34,5,utf8_decode('Usa prótesis u órtesis?:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode( ' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(38,5,utf8_decode('Tipo de prótesis u órtesis:'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(93,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();
$pdf->Ln(1);

$pdf->SetFont('Arial','B',8);
$pdf->Cell(46,5,utf8_decode('Requiere asistencia/supervisión?'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Siempre:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para asistenciaSi
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(28,5,utf8_decode('Tareas específicas:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para asistenciaNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Nunca:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para asistenciaNA
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Duración:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(19,5,utf8_decode('Permanente:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para permanenteSi
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Temporal:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para permanenteNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(7,5,utf8_decode('N/A:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C'); //variable para permanenteNo
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Alergias:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',9);
$pdf->Cell(73,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(23,5,utf8_decode('Enfermedades:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',9);
$pdf->Cell(78,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(25,5,utf8_decode('Medicamentos:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(165,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();
$pdf->Ln();


$pdf->SetLineWidth(0.5);
$pdf->Line(10, 206, 211-10, 206); // 20mm from each edge
$pdf->SetLineWidth(0.2);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(191,5,utf8_decode('VIVIENDA'),0,0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Propia:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Prestada:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Rentada:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' ' ),'BR',0,'C');
$pdf->Cell(15,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(27,5,utf8_decode('Está a su nombre?:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(6,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(25,5,utf8_decode('Tipo de vivienda:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Casa:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(22,5,utf8_decode('Departamento:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Vecindad:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(88,5,utf8_decode(' '),'B',0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(30,5,utf8_decode('No. de dormitorios:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(7,5,utf8_decode(' '),'B',0,'C');
$pdf->SetFont('Arial','',8);
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Cocina:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);;
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Sala:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);;
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Baño:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(19,5,utf8_decode('Num. Baños:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(8,5,utf8_decode(' '),'B',0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Interior:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);;
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Exterior:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(25,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Techo:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(16,5,utf8_decode('Cemento:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Lámina:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(22,5,utf8_decode(' '),'B',0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Pared:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(12,5,utf8_decode('Block:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Ladrillo:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Adobe:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(10,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(26,5,utf8_decode(' '),'B',0,'L');
$pdf->Ln();
$pdf->Ln(1);

$pdf->SetFont('Arial','B',8);
$pdf->Cell(27,5,utf8_decode('Servicios básicos:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(21,5,utf8_decode('Agua potable:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(21,5,utf8_decode('Luz eléctrica:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Drenaje:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(14,5,utf8_decode('Internet:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(13,5,utf8_decode('Celular:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Carro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(9,5,utf8_decode('Gas:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(5,5,utf8_decode(' '),'BR',0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(27,5,utf8_decode(''),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Teléfono:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(35,5,utf8_decode(' '),'B',0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(29,5,utf8_decode('Electrodomésticos:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(15,5,utf8_decode('Lavadora:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(25,5,utf8_decode('Disp. Inteligente:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(19,5,utf8_decode('Microondas:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(9,5,utf8_decode('T.V.:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(22,5,utf8_decode('Computadora:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Licuadora:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(30,5,utf8_decode(''),0,0,'L');
$pdf->Cell(10,5,utf8_decode('Estufa:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(20,5,utf8_decode('Refrigerador:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(11,5,utf8_decode('Otro:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Ln();



$pdf->SetFont('Arial','B',8);
$pdf->Cell(40,5,utf8_decode('Es dependiente económico?'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Cell(6,5,utf8_decode('Sí:'),0,0,'L');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(7,5,utf8_decode('No:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('ZapfDingbats','', 10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(24,5,utf8_decode('Indique de quién:'),0,0,'L');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(45,5,utf8_decode(' '),'B',0,'L');
$pdf->SetFont('Arial','B',8);
$pdf->Cell(50,5,utf8_decode('Núm. dependientes económicos?'),0,0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->SetFont('Arial','',10);
$pdf->Cell(4,5,utf8_decode(' '),'BR',0,'C');
$pdf->Cell(1,5,utf8_decode(''),0,0,'C');
$pdf->Ln();
$pdf->Ln();

$pdf->Line(10, 300, 211-10, 300); // 20mm from each edge
$pdf->SetFont('Arial','B',9);
$pdf->Cell(191,5,utf8_decode('INTEGRACIÓN FAMILIAR'),0,0,'L');
$pdf->Ln();
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(49,5,utf8_decode('Nombre:'),1,0,'C');
$pdf->Cell(20,5,utf8_decode('Parentesco:'),1,0,'C');
$pdf->Cell(12,5,utf8_decode('Edad:'),1,0,'L');
$pdf->Cell(25,5,utf8_decode('Escolaridad:'),1,0,'C');
$pdf->Cell(30,5,utf8_decode('Profesión u Oficio:'),1,0,'C');
$pdf->Cell(25,5,utf8_decode('Discapacidad:'),1,0,'C');
$pdf->Cell(15,5,utf8_decode('Ingreso:'),1,0,'C');
$pdf->Cell(15,5,utf8_decode('Teléfono:'),1,0,'C');
$pdf->Ln();

/* $sqlFamiliares = "SELECT * FROM integracion WHERE curp = '$curp'";
$resultadosqlFamiliares = $conn->query($sqlFamiliares);

while ($rowSqlFamiliares = $resultadosqlFamiliares->fetch_assoc()){
  $pdf->SetFont('Arial','',8);
  $pdf->Cell(49,5,utf8_decode(' '),1,0,'C');
  $pdf->Cell(20,5,utf8_decode(' '),1,0,'C');
  $pdf->Cell(12,5,utf8_decode(' '),1,0,'L');
  $pdf->Cell(25,5,utf8_decode(' '),1,0,'C');
  $pdf->Cell(30,5,utf8_decode(' '),1,0,'C');
  $pdf->Cell(25,5,utf8_decode(' '),1,0,'C');
  $pdf->Cell(15,5,utf8_decode(' '),1,0,'C');
  $pdf->SetFont('Arial','',7);
  $pdf->Cell(15,5,utf8_decode(' '),1,0,'C');
  $pdf->Ln();
} */

$pdf->Ln();

$pdf->Line(10, 300, 211-10, 300); // 20mm from each edge
$pdf->SetFont('Arial','B',9);
$pdf->Cell(191,5,utf8_decode('REFERENCIAS PERSONALES'),0,0,'L');
$pdf->Ln();
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(55,5,utf8_decode('Nombre:'),1,0,'C');
$pdf->Cell(20,5,utf8_decode('Parentesco:'),1,0,'C');
$pdf->Cell(70,5,utf8_decode('Domicilio:'),1,0,'C');
$pdf->Cell(31,5,utf8_decode('Profesión u Oficio:'),1,0,'C');
$pdf->Cell(15,5,utf8_decode('Teléfono:'),1,0,'C');
$pdf->Ln();

/* $sqlReferencias = "SELECT * FROM referencias WHERE curp = '$curp' AND expediente = '$expediente'";
$resultadosqlReferencia = $conn->query($sqlReferencias);

while ($rowSqlReferencia = $resultadosqlReferencia->fetch_assoc()){
  $pdf->SetFont('Arial','',8);
  $pdf->Cell(55,5,utf8_decode($rowSqlReferencia['nombre']),1,0,'C');
  $pdf->Cell(20,5,utf8_decode($rowSqlReferencia['parentesco']),1,0,'C');
  $pdf->Cell(70,5,utf8_decode($rowSqlReferencia['direccion']),1,0,'C');
  $pdf->Cell(31,5,utf8_decode($rowSqlReferencia['profesion_oficio']),1,0,'C');
  $pdf->SetFont('Arial','',7);
  $pdf->Cell(15,5,utf8_decode($rowSqlReferencia['celular']),1,0,'C');
  $pdf->Ln();
} */

$pdf->Ln();

$pdf->Line(10, 300, 211-10, 300); // 20mm from each edge
$pdf->SetFont('Arial','B',9);
$pdf->Cell(191,5,utf8_decode('SERVICIOS SOLICITADOS'),0,0,'L');
$pdf->Ln();
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(17,5,utf8_decode('Folio:'),1,0,'C');
$pdf->Cell(30,5,utf8_decode('Fecha Solicitud:'),1,0,'C');
$pdf->Cell(30,5,utf8_decode('Tipo Solicitud:'),1,0,'C');
$pdf->Cell(67,5,utf8_decode('Descripción:'),1,0,'C');
$pdf->Cell(31,5,utf8_decode('Fecha Entrega:'),1,0,'C');
$pdf->Cell(15,5,utf8_decode('Estatus:'),1,0,'C');
$pdf->Ln();

/* $sqlServicios = "SELECT * FROM servicios WHERE curp = '$curp'";
$resultadosqlServicios = $conn->query($sqlServicios);

while ($rowSqlServicios = $resultadosqlServicios->fetch_assoc()){
  $pdf->SetFont('Arial','',6);
  $pdf->Cell(17,5,utf8_decode($rowSqlServicios['folio_solicitud']),1,0,'C');
  $pdf->SetFont('Arial','',7);
  $pdf->Cell(30,5,utf8_decode($rowSqlServicios['fecha_solicitud']),1,0,'C');
  $pdf->Cell(30,5,utf8_decode($rowSqlServicios['tipo_solicitud']),1,0,'C');
  $pdf->Cell(67,5,utf8_decode($rowSqlServicios['detalle_solicitud']),1,0,'C');
  $pdf->Cell(31,5,utf8_decode($rowSqlServicios['fecha_entrega']),1,0,'C');
  $pdf->Cell(15,5,utf8_decode($rowSqlServicios['estatus_s']),1,0,'C');
  $pdf->Ln();
}
$sqlSolicitud = "SELECT * FROM solicitud WHERE curp = '$curp'";
$resultadosqlSolicitud = $conn->query($sqlSolicitud);
while ($rowSqlSolicitud = $resultadosqlSolicitud->fetch_assoc()){
  $folioSolicitud = $rowSqlSolicitud['folio_solicitud'];
  $tipoSolicitud = $rowSqlSolicitud['tipo'];
  if ($tipoSolicitud == 1){
    $tipo = "Funcional";
  }
  else if ($tipoSolicitud == 2){
    $tipo = "Extraordinario";
  } 
  else if ($tipoSolicitud == 3){
      $tipo = "Otro";
  } 
  else if ($tipoSolicitud == 4){
      $tipo = "Credencial";
  } 
  else if ($tipoSolicitud == 5){
      $tipo = "Tarjetón";
  } 
  $estatus = $rowSqlSolicitud['estatus'];
  if ($estatus == 1){
    $statusE = "Entregado";
  }
  else {
    $statusE = "Espera";
  }
  $pdf->SetFont('Arial','',6);
  $pdf->Cell(17,5,utf8_decode($folioSolicitud),1,0,'C');
  $pdf->SetFont('Arial','',7);
  $pdf->Cell(30,5,utf8_decode($rowSqlSolicitud['fecha_solicitud']),1,0,'C');
  $pdf->Cell(30,5,utf8_decode(""),1,0,'C');
  $pdf->Cell(67,5,utf8_decode($tipo),1,0,'C');
  $pdf->Cell(31,5,utf8_decode($rowSqlSolicitud['entrega']),1,0,'C');
  $pdf->Cell(15,5,utf8_decode($statusE),1,0,'C');
  $pdf->Ln();
} */

$pdf->Ln();
$pdf->Ln();
$pdf->SetFont('Arial','B',8);
$pdf->Cell(191,3,utf8_decode('Fecha de Actualización: '),0,0,'C');
$pdf->Ln();
$pdf->Ln();
$pdf->SetFont('Arial','B',10);
$pdf->Cell(191,3,utf8_decode('Zacatecas, Zac. a '),0,0,'C');
$pdf->Ln();
$pdf->Ln();
$pdf->Ln();


$pdf->SetFont('Arial','B',8);
$pdf->Cell(95,5,utf8_decode('Firma del responsable del llenado:'),1,0,'C');
$pdf->Cell(96,5,utf8_decode('Firma de Autorización de uso de Datos Personales:'),1,0,'C');
$pdf->Ln();
$pdf->Cell(95,20,utf8_decode(''),1,0,'C');
$pdf->Cell(96,20,utf8_decode(''),1,0,'C');
$pdf->Ln();
$pdf->Cell(95,5,utf8_decode(' '),1,0,'C');
$pdf->Cell(96,5,utf8_decode(' '),1,0,'C');
$pdf->Ln();
$pdf->Ln();
$pdf->Ln();
$pdf->Ln();

$pdf->SetFont('Arial','B',5);
$pdf->Cell(191,3,utf8_decode('Estimado usuario y/o beneficiario, la información proporcionada al Instituto para la Atención e Inclusión de las Personas con Discapacida, está debidamente protegida por la ley de Protección'),0,0,'C');
$pdf->Ln();
$pdf->Cell(191,3,utf8_decode('de Datos Personales en Posesión de los Sujetos Obligados del Estado de Zacatecas, si deseas más información puedes consultar nuestro aviso de privacidad en: https://inclusion.zacatecas.gob.mx/aviso-de-privacidad'),0,0,'C');
$pdf->Ln();
$pdf->Ln();


$pdf->Output();
?>