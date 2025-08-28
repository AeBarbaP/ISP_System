<?php
require('../../dashboard/prcd/conn.php');
//return;
$fechaInicial = $_POST['fechaInicial'];
$fechaFinal = $_POST['fechaFinal'];

$sql = "SELECT * FROM pagos_generales WHERE DATE(fecha_pago) BETWEEN '$fechaInicial' AND '$fechaFinal'";
$resultado = $conn->query($sql);
$x=0;
while ($row = $resultado->fetch_assoc()){
$x++;
    $folio = $row['folio_contrato'];
    
    $rowCliente = $conn->query("SELECT * FROM clientes WHERE folio = '$folio'")->fetch_assoc();
    
        $comunidad = $rowCliente['comunidad'];
        $paquete = $rowCliente['servicio'];
    
        $rowClientePaquete = $conn->query("SELECT * FROM catalogo_paquetes WHERE id = '$paquete'")->fetch_assoc();

    if ($comunidad && (is_null($comunidad) || $comunidad == "")) {
    $comunidad = "Sin datos";
    } else if ($comunidad) {
        $comunidad = $comunidad;
    } else {
        $comunidad = "Sin datos";
    }

    if($rowCliente['estatus'] == 1){
        $estatus = "Activo";
    }
    else{
        $estatus = "Inactivo";
    }

        echo'
        <tr>
            <td>'.$x.'</td>
            <td>'.$row['folio_pago'].'</td>
            <td>'.$rowCliente['nombre'].'</td>
            <td>'.$comunidad.'</td>
            <td>'.$row['fecha_pago'].'</td>
            <td>'.$row['periodo'].'</td>
            <td>'.$row['total'].'</td>
            <td><a href="#" onclick="pagosIndividuales(\''.$row['folio_pago'].'\')"><i class="bi bi-eye"></i></a></td>
        </tr>
        ';
}

?>