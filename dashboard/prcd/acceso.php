<?php
session_start();

require('conn.php');

date_default_timezone_set('America/Mexico_City');
setlocale(LC_TIME, 'es_MX.UTF-8');
// $userLog = $_SESSION['username'];
$fechaHoy = strftime("%Y-%m-%d,%H:%M:%S");

$usr = $_POST['usr'];
$pwd = $_POST['pwd'];

$query = "SELECT * FROM users WHERE username = '$usr' AND pwd = '$pwd'";
$resultado = $conn->query($query);
$filas = $resultado->num_rows;

if($filas == 1){ 
    $_SESSION['sess'] = 1;
    $row = $resultado->fetch_assoc();

    $id = $row['id'];
    
    $_SESSION['idUsr'] = $row['id'];
    $_SESSION['username'] = $row['username'];

    $username = $row['username'];
    $nombre = $row['nombre'];
    $tipo_usr = $row['tipo_usr'];
    
    $_SESSION['nombre'] = $row['nombre'];
    $_SESSION['tipo_usr'] = $row['tipo_usr'];
    $_SESSION['estatusCorte'] = revisarCorte($id);

    $userLog = $_SESSION['username'];

    // --------- log ---------------
        $sqlLOG = "INSERT INTO log_users(
        username,
        accion,
        hora,
        folio_cliente
        )
        VALUES(
        '$userLog',
        21,
        '$fechaHoy',
        'NA')
        ";
        $resultadoLOG = $conn->query($sqlLOG);
        // --------- log ---------------

    echo json_encode(array(
        'success'=>1,
        'username'=>$username,
        'nombre'=>$nombre,
        'tipo_usr'=>$tipo_usr,
        'idUsr'=>$idUsr
    ));
}
else{
    $_SESSION['sess'] = "";
    echo json_encode(array(
        'success'=>0
    ));
}

function revisarCorte($id){

    require('conn.php');

    $sqlCorte = "SELECT * FROM corte_caja WHERE usr ='$id'";
    $resultadoCorte = $conn->query($sqlCorte);
    $filas = $resultadoCorte->num_rows;

    if($filas == 1){
        $rowCorte = $resultadoCorte->fetch_assoc();
        $corte = $rowCorte['estatus']; //esta variable confirma si está cortado el servicio o no
        return $corte;
    }
    else{
        $corte = 0;
        return $corte;
    }

}