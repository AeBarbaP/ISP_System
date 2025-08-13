<?php
require('../../dashboard/prcd/conn.php');

$folio = $_POST['folio'];

$sql = "SELECT * FROM clientes WHERE folio = '$folio'";
$resultado = $conn->query($sql);
if($resultado){
$row = $resultado->fetch_assoc();

echo json_encode(array(
    'success'=>1,
    'folio'=>$row['folio'],
    'nombre'=>$row['nombre'],
    'domicilio'=>$row['domicilio'],
    'calle'=>$row['calle'],
    'colonia'=>$row['colonia'],
    'comunidad'=>$row['comunidad'],
    'municipio'=>$row['municipio'],
    'estado'=>$row['estado'],
    'cp'=>$row['cp'],
    'telefono'=>$row['telefono'],
    'referencias'=>$row['referencias'],
    'identificacion'=>$row['identificacion'],
    'comprobante'=>$row['comprobante'],
    'servicio'=>$row['servicio'],
    'antena'=>$row['antena'],
    'direccionip'=>$row['direccionip'],
    'direccion_ip_ap'=>$row['direccion_ip_ap'],
    'fecha_contrato'=>$row['fecha_contrato'],
    'fecha_limite'=>$row['fecha_limite'],
    'fecha_corte'=>$row['fecha_corte'],
    'cuota'=>$row['cuota'],
    'estatus'=>$row['estatus']
));

}
else{
    $error = $conn->error;
    echo json_encode(array(
        'success'=>0,
        'error'=>$error
    ));
}

?>