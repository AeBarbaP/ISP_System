<?php
require('../prcd/conn.php');

$folio = $_POST['folio'];

// Obtener información del cliente, especialmente la fecha de corte
$sqlCorte = "SELECT fecha_corte FROM clientes WHERE folio = '$folio'";
$resultadoCorte = $conn->query($sqlCorte);
$corte = $resultadoCorte->fetch_assoc();
$fechaCorte = new DateTime($corte['fecha_corte']);

// Obtener el mes y año de la fecha de corte
$mesCorte = (int)$fechaCorte->format('n'); // Mes numérico (1-12)
$anoCorte = (int)$fechaCorte->format('Y'); // Año

// Fecha actual para comparar
$hoy = new DateTime();
$mesActual = (int)$hoy->format('n');
$anoActual = (int)$hoy->format('Y');

// Consulta para obtener los pagos del cliente
$sql = "SELECT * FROM pagos WHERE folio_contrato = '$folio' ORDER BY periodo";
$resultado = $conn->query($sql);

$pagos = array();

// Procesar pagos existentes
while ($row = $resultado->fetch_assoc()) {
    $concepto = $row['concepto'];
    $sqlConcepto2 = "SELECT * FROM conceptos WHERE id = '$concepto'";
    $resultadoConcepto = $conn->query($sqlConcepto2);
    $rowConcepto = $resultadoConcepto->fetch_assoc();
    $concepto2 = $rowConcepto['concepto'];
    $pagos[] = array(
        'folio_contrato' => $row['folio_contrato'],
        'concepto' => $concepto2,
        'periodo' => $row['periodo'],
        'mes' => (int)$row['periodo'], // Mes del pago (1-12)
        'monto' => $row['total']
    );
}

// Generar array con todos los meses desde corte hasta actual
$mesesRequeridos = array();
$mesActualCalculo = $mesCorte;
$anoActualCalculo = $anoCorte;

while ($anoActualCalculo < $anoActual || ($anoActualCalculo == $anoActual && $mesActualCalculo <= $mesActual)) {
    $mesesRequeridos[] = $mesActualCalculo;
    
    $mesActualCalculo++;
    if ($mesActualCalculo > 12) {
        $mesActualCalculo = 1;
        $anoActualCalculo++;
    }
}

// Verificar qué meses tienen pago y cuáles no
$pagosFinal = array();
foreach ($mesesRequeridos as $mes) {
    $pagoEncontrado = null;
    
    // Buscar si existe pago para este mes
    foreach ($pagos as $pago) {
        if ($pago['mes'] == $mes) {
            $pagoEncontrado = $pago;
            break;
        }
    }
    
    if ($pagoEncontrado) {
        $pagosFinal[] = $pagoEncontrado;
    } else {
        // Agregar mes sin pago
        $pagosFinal[] = array(
            'mes' => $mes,
            'pagado' => false
        );
    }
}

echo json_encode($pagosFinal);
?>