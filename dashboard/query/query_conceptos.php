<?php

require('../prcd/conn.php');

$sql1 = "SELECT * FROM conceptos ORDER BY id ASC";
$resultado1 = $conn->query($sql1);
echo'
<option value="" selected>Selecciona el concepto ...</option>
';
while($row1 = $resultado1->fetch_assoc()){
    $idConcepto = $row1['id'];

    echo'
    <optgroup label="'.$row1['concepto'].'" id="'.$row1['concepto'].'">';
    
        if($idConcepto == 1){
            $sql = "SELECT * FROM catalogo_paquetes ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()){
                echo'
                <option value="'.$row['id'].'">'.$row['paquetes'].'</option>
                ';
            }
        }
        else if($idConcepto == 2){
            $sql = "SELECT * FROM catalogo_instalacion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()){
                echo'
                <option value="'.$row['id'].'">'.$row['tipo_instalacion'].'</option>
                ';
            }
        }
        else if($idConcepto == 3){
            $sql = "SELECT * FROM catalogo_reconexion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()){
                echo'
                <option value="'.$row['id'].'">'.$row['tipo_reconexion'].'</option>
                ';
            }
        }
        else if($idConcepto == 4){
            $sql = "SELECT * FROM catalogo_adelanto ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()){
                echo'
                <option value="'.$row['id'].'">'.$row['tipo_adelanto'].'</option>
                ';
            }
        }
        else if($idConcepto == 5){
            $sql = "SELECT * FROM promociones WHERE estatus = 1 ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()){
                echo'
                <option value="'.$row['id'].'">'.$row['promo'].' | -$'.$row['descuento'].'</option>
                ';
            }
        }

    echo'    
    </optgroup>
    ';
}

?>