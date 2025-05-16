<?php
require('../prcd/conn.php');

// Obtener el folio del cliente
$folioCliente = $_POST['folio'];
$recargo = 420; // Valor del recargo

// Array para almacenar los meses adeudados
$adeudos = array();

// Mostrar opciones
echo '<option value="" selected>Selecciona el concepto ...</option>';
echo '<optgroup label="Adeudos Pendientes">';

if (!empty($folioCliente)) {
    // 1. Obtener fecha de corte del cliente
    $sqlCorte = "SELECT * FROM clientes WHERE folio = '$folioCliente'";
    $resultadoCorte = $conn->query($sqlCorte);
    $rowCorte = $resultadoCorte->fetch_assoc();

    $inicio = new DateTime($rowCorte['fecha_corte']);
    $fin = new DateTime();

    $folioContrato = $rowCorte['folio'];

    $meses = [
    '01' => 'Enero', '02' => 'Febrero', '03' => 'Marzo',
    '04' => 'Abril', '05' => 'Mayo', '06' => 'Junio',
    '07' => 'Julio', '08' => 'Agosto', '09' => 'Septiembre',
    '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre'
];

while ($inicio <= $fin) {
    $mes = $inicio->format('m');
    $anio = $inicio->format('Y');

    // Consulta por mes y año en MySQL
    $sql = "SELECT * FROM pagos 
            WHERE folio_contrato = '$folioContrato' 
            AND MONTH(fecha_pago) = '$mes' 
            AND YEAR(fecha_pago) = '$anio'";

    $resultado = $conn->query($sql);
    $row = $resultado->fetch_assoc();

    $adeudo = $inicio->format('Y-m');

    if ($row) {
        echo "Ya existe un pago para el mes: " . $adeudo . "<br>";
    } else {
        $nombreMes = $meses[$mes]; // Obtener el nombre del mes en español
        echo '<option value="'.$adeudo.'" data-categoria="1" data-costo="'.$rowCorte['cuota'].'" data-concepto="Recargo" data-periodo="'.$adeudo.'">'.$nombreMes.' '.$anio.'</option>';
    }

    $inicio->modify('+1 month');
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
                echo '<option value="'.$row['id'].'" data-categoria="2" data-costo="'.$row['costo'].'" data-concepto="Paquete" data-periodo="Periodo prueba">'.$row['paquetes'].'</option>';
            }
            break;
            
        case 2:
            $sql = "SELECT * FROM catalogo_instalacion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '" data-categoria="3" data-costo="'.$row['costo'].'" data-concepto="Instalación" data-periodo="Instalación">' . $row['tipo_instalacion'] . '</option>';
            }
            break;
            
        case 3:
            $sql = "SELECT * FROM catalogo_reconexion ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '" data-categoria="4" data-costo="'.$row['costo'].'" data-concepto="Reconexión" data-periodo="Reconexión">' . $row['tipo_reconexion'] . '</option>';
            }
            break;
            
        case 4:
            $sql = "SELECT * FROM catalogo_adelanto ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '" data-categoria="5" data-costo="'.$row['costo'].'" data-concepto="Adelanto ' . $row['tipo_adelanto'] . '" data-periodo="' . $row['tipo_adelanto'] . '">' . $row['tipo_adelanto'] . '</option>';
            }
            break;
            
        case 5:
            $sql = "SELECT * FROM promociones WHERE estatus = 1 ORDER BY id ASC";
            $resultado = $conn->query($sql);
            while($row = $resultado->fetch_assoc()) {
                echo '<option value="' . $row['id'] . '" data-categoria="6" data-costo="'.$row['costo'].'" data-concepto="Descuento" data-periodo="Descuento">' . $row['promo'] . ' | -$' . $row['descuento'] . '</option>';
            }
            break;
    }
    
    echo '</optgroup>';
}

?>