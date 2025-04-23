<?php
require('../prcd/conn.php');

// Obtener el folio del cliente
$folioCliente = $_POST['folio'];

// Array para almacenar los meses adeudados
$adeudos = array();

if (!empty($folioCliente)) {
    // 1. Obtener fecha de corte del cliente
    $sqlCorte = "SELECT fecha_corte FROM clientes WHERE folio = '$folioCliente'";
    $resultadoCorte = $conn->query($sqlCorte);
    
    if ($resultadoCorte->num_rows > 0) {
        $corte = $resultadoCorte->fetch_assoc();
        $fechaCorte = new DateTime($corte['fecha_corte']);
        $fechaActual = new DateTime();

        // 2. Obtener TODOS los periodos que deberían estar pagados (desde fecha corte hasta hoy)
        $periodosDebenEstarPagados = array();
        $fechaIteracion = clone $fechaCorte;
        
        while ($fechaIteracion <= $fechaActual) {
            $mes = (int)$fechaIteracion->format('n');
            $ano = (int)$fechaIteracion->format('Y');
            $periodosDebenEstarPagados[] = $ano . '-' . str_pad($mes, 2, '0', STR_PAD_LEFT);
            $fechaIteracion->add(new DateInterval('P1M'));
        }

        // 3. Obtener los periodos que SÍ están pagados
        $sqlPagos = "SELECT periodo, annio FROM pagos 
                     WHERE folio_contrato = '$folioCliente' 
                     AND concepto = 'Mensualidad'";
        $resultadoPagos = $conn->query($sqlPagos);

        $periodosPagados = array();
        while ($row = $resultadoPagos->fetch_assoc()) {
            $periodosPagados[] = $row['annio'] . '-' . str_pad($row['periodo'], 2, '0', STR_PAD_LEFT);
        }

        // 4. Comparar para encontrar los adeudos (lo que debe estar pagado pero no está)
        $mesesNombres = array(
            1 => 'Enero', 2 => 'Febrero', 3 => 'Marzo', 4 => 'Abril', 
            5 => 'Mayo', 6 => 'Junio', 7 => 'Julio', 8 => 'Agosto', 
            9 => 'Septiembre', 10 => 'Octubre', 11 => 'Noviembre', 12 => 'Diciembre'
        );

        foreach ($periodosDebenEstarPagados as $periodo) {
            if (!in_array($periodo, $periodosPagados)) {
                list($ano, $mes) = explode('-', $periodo);
                $mes = (int)$mes; // Convertir a entero para eliminar el cero inicial
                $adeudos[] = array(
                    'mes' => $mes,
                    'ano' => $ano,
                    'nombre' => $mesesNombres[$mes] . ' ' . $ano,
                    'valor' => 'adeudo_' . $mes . '_' . $ano
                );
            }
        }
    }
}

// Mostrar opciones
echo '<option value="" selected>Selecciona el concepto ...</option>';

// Mostrar adeudos primero (si existen)
if (!empty($adeudos)) {
    echo '<optgroup label="Adeudos Pendientes">';
    foreach ($adeudos as $adeudo) {
        echo '<option value="' . $adeudo['valor'] . '">' . $adeudo['nombre'] . '</option>';
    }
    echo '</optgroup>';
}

// Mostrar otros conceptos
$sqlConceptos = "SELECT * FROM conceptos ORDER BY id ASC";
$resultadoConceptos = $conn->query($sqlConceptos);

while($concepto = $resultadoConceptos->fetch_assoc()) {
    echo '<optgroup label="' . $concepto['concepto'] . '" id="' . $concepto['concepto'] . '">';
    
    switch($concepto['id']) {
        case 1:
            $sql = "SELECT * FROM catalogo_paquetes WHERE estatus = 1 ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="'.$row['id'].'" data-costo="'.$row['costo'].'" data-concepto="Paquete" data-periodo="Periodo prueba">'.$row['paquetes'].'</option>';
            }
            break;
            
        case 2:
            $sql = "SELECT * FROM catalogo_instalacion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '">' . $row['tipo_instalacion'] . '</option>';
            }
            break;
            
        case 3:
            $sql = "SELECT * FROM catalogo_reconexion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '">' . $row['tipo_reconexion'] . '</option>';
            }
            break;
            
        case 4:
            $sql = "SELECT * FROM catalogo_adelanto ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '">' . $row['tipo_adelanto'] . '</option>';
            }
            break;
            
        case 5:
            $sql = "SELECT * FROM promociones WHERE estatus = 1 ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '">' . $row['promo'] . ' | -$' . $row['descuento'] . '</option>';
            }
            break;
    }
    
    echo '</optgroup>';
}


// require('../prcd/conn.php');

// $sql1 = "SELECT * FROM conceptos ORDER BY id ASC";
// $resultado1 = $conn->query($sql1);
// echo'
// <option value="" selected>Selecciona el concepto ...</option>
// ';
// while($row1 = $resultado1->fetch_assoc()){
//     $idConcepto = $row1['id'];

//     echo'
//     <optgroup label="'.$row1['concepto'].'" id="'.$row1['concepto'].'">';
    
//         if($idConcepto == 1){
//             $sql = "SELECT * FROM catalogo_paquetes ORDER BY id ASC";
//             $resultado = $conn->query($sql);
//             while($row = $resultado->fetch_assoc()){
//                 echo'
//                 <option value="'.$row['id'].'">'.$row['paquetes'].'</option>
//                 ';
//             }
//         }
//         else if($idConcepto == 2){
//             $sql = "SELECT * FROM catalogo_instalacion ORDER BY id ASC";
//             $resultado = $conn->query($sql);
//             while($row = $resultado->fetch_assoc()){
//                 echo'
//                 <option value="'.$row['id'].'">'.$row['tipo_instalacion'].'</option>
//                 ';
//             }
//         }
//         else if($idConcepto == 3){
//             $sql = "SELECT * FROM catalogo_reconexion ORDER BY id ASC";
//             $resultado = $conn->query($sql);
//             while($row = $resultado->fetch_assoc()){
//                 echo'
//                 <option value="'.$row['id'].'">'.$row['tipo_reconexion'].'</option>
//                 ';
//             }
//         }
//         else if($idConcepto == 4){
//             $sql = "SELECT * FROM catalogo_adelanto ORDER BY id ASC";
//             $resultado = $conn->query($sql);
//             while($row = $resultado->fetch_assoc()){
//                 echo'
//                 <option value="'.$row['id'].'">'.$row['tipo_adelanto'].'</option>
//                 ';
//             }
//         }
//         else if($idConcepto == 5){
//             $sql = "SELECT * FROM promociones WHERE estatus = 1 ORDER BY id ASC";
//             $resultado = $conn->query($sql);
//             while($row = $resultado->fetch_assoc()){
//                 echo'
//                 <option value="'.$row['id'].'">'.$row['promo'].' | -$'.$row['descuento'].'</option>
//                 ';
//             }
//         }

//     echo'    
//     </optgroup>
//     ';
// }
?>