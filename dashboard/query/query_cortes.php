<?php
require('../prcd/conn.php');

$sql = "SELECT * FROM cortes"; // Busca coincidencias parciales
$resultado = $conn->query($sql);
$x=0;
while($row = $resultado->fetch_assoc()){
    $x++;
    $folio_cliente = $row['folio_cliente'];
    $sqlCliente = "SELECT * FROM clientes WHERE folio = '$folio_cliente'";
    $resultadoCliente = $conn->query($sqlCliente);
    $rowCliente = $resultadoCliente->fetch_assoc();

    $cliente = $rowCliente['nombre'];
    $domicilio = $rowCliente['domicilio'];

    $tecnico = $row['tecnico'];

    $fecha = $row['fecha'];
    $estatus = $row['estatus'];

    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['folio_corte'].'</td>
        <td>'.$cliente.'</td>
        <td>'.$domicilio.'</td>';
        if($tecnico === NULL){
            echo '<td><span style="border-radius: 5px; background-color:red; padding:5px; color:white; font-size:8px">No asignado</span></td>';
        }
        else{
            $tecnico_a = $row['tecnico'];
            $sqlTecnico = "SELECT * FROM tecnicos WHERE id = '$tecnico_a' AND estatus = 1";
            $resultado_a = $conn->query($sqlTecnico);
            $row_a = $resultado_a->fetch_assoc();
            echo '<td><span style="border-radius: 5px; background-color:blue; padding:5px; color:white; font-size:8px">'.$row_a['nombre'].'</span></td>';
        }
        // <td>'.$tecnico_asignado.'</td>
        echo '<td>'.$row['fecha'].'</td>';
        if($row['estatus'] == 1){
            echo'<td>Corte realizado</td>';
        }
        else{
            echo'<td>Corte no realizado</td>';
        }
        echo '<td><a href="#" onclick="abrirEdicionCorte(\''.$row['folio_corte'].'\')"><i class="bi bi-pencil-square"></i></a> | <a href="#" onclick="eliminarCorte('.$row['id'].')"><i class="bi bi-trash"></i></a></td>
    </tr>
    ';
}

?>