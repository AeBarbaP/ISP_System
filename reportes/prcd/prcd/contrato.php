<?php
require('pdf/fpdf/fpdf.php');

class PDF extends FPDF {
    function Header() {
        // Agregar una imagen (ajusta la ruta, el tamaño y la posición)
        $this->Image('logo.png', 60, 9, 90); // Ruta, posición X, posición Y, ancho
        $this->SetY(36); // Ajustar el margen para evitar que el texto se empalme
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'CONTRATO DE PRESTACION DE SERVICIOS DE RED INALAMBRICA E INTERNET', 0, 1, 'C');
        $this->Ln(5);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo(), 0, 0, 'C'); // Texto centrado
    }
}

$pdf = new PDF();
$pdf->SetMargins(15, 10, 15); // Márgenes reducidos (izquierda, arriba, derecha)
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 10);
$pdf->MultiCell(0, 7, utf8_decode(
    'CONTRATO DE PRESTACIÓN DE SERVICIOS DE RED INALÁMBRICA E INTERNET QUE CELEBRAN POR UNA PARTE LA EMPRESA "CONECTWI" REPRESENTADA POR EL ING. SERGIO PAVEL MERCADO ARTEAGA, POR OTRA PARTE, EL SUSCRIPTOR CUYO NOMBRE Y DOMICILIO SE ESPECIFICAN EN LA PARTE FRONTAL DEL PRESENTE CONTRATO:'
));
$pdf->Cell(0, 7, "\n\n", 0, 1);

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, 'DATOS DEL CLIENTE:', 0, 1,'C');
$pdf->SetFont('Arial', '', 10);
$pdf->MultiCell(0, 7, utf8_decode(
    "Nombre del Cliente: __________________________________________________________________________\n".
    "Domicilio: ________________________________________".
    " Comunidad: _______________________________\n".
    " Municipio: ________________________________\n".
    "Estado: _________________________________".
    "Número de Teléfono: _________________________________________________________________________\n".
    "Fecha de Instalación: ____________________________".
    " IP del Cliente: ________________________________\n".
    "Total a pagar: _________________________________".
    "Mes/es Pagados: _______________________________\n\n"
));

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, 'AMBAS PARTES SE SOMETEN DE CONFORMIDAD A LAS SIGUIENTES CLAUSULAS:', 0, 1,'C');
$pdf->SetFont('Arial', '', 10);

$clausulas = [
    "PRIMERA" => "El presente contrato se celebra con el objetivo de que \"CONECTWI\" proporcione servicio de Internet al domicilio del suscriptor, quien declara que desea solicitar el servicio, que tiene capacidad legal para contratar y que está de acuerdo en llevar a cabo el presente contrato.",
    "SEGUNDA" => "\"CONECTWI\" tiene la responsabilidad de instalar el servicio en el domicilio del cliente en un máximo de 10 días hábiles después de su contratación. En caso de no poder proporcionar el servicio por causas ajenas a la empresa, ésta deberá dar aviso al cliente lo antes posible y regresar íntegro el costo pagado por la instalación del servicio.",
    "TERCERA" => "El suscriptor debe proporcionar las condiciones ideales, tales como servicio de energía eléctrica.",
    "CUARTA" => "El equipo receptor del servicio de Internet, que se instala en el domicilio del cliente, es única y exclusivamente para recibir la señal de Internet de \"CONECTWI\". Cualquier otro uso que se le dé al equipo será causa de cancelación del contrato sin responsabilidad alguna para \"CONECTWI\".",
    "QUINTA" => "Por ningún motivo está permitido compartir la conexión con vecinos. Si el suscriptor hace mal uso del servicio, \"CONECTWI\" podrá cancelar el contrato sin responsabilidad alguna.",
    "SEXTA" => "El suscriptor debe pagar dentro de los primeros 5 días de cada mes. Si no lo hace, \"CONECTWI\" podrá cancelar el servicio y retirar el equipo sin responsabilidad alguna.",
    "SÉPTIMA" => "\"CONECTWI\" no es responsable por el funcionamiento del equipo del suscriptor ni por interrupciones debido a mantenimiento o reparaciones.",
    "OCTAVA" => "En caso de fallas, el suscriptor debe reportarlas a \"CONECTWI\". No está permitido modificar los equipos o instalaciones.",
    "NOVENA" => "La alta demanda del servicio puede afectar su velocidad, lo cual no será responsabilidad de \"CONECTWI\".",
    "DÉCIMA" => "\"CONECTWI\" no se hace responsable por el uso que el suscriptor dé a la información obtenida a través de Internet.",
    "DÉCIMA PRIMERA" => "Si el suscriptor cambia de domicilio, debe notificarlo con al menos 10 días de anticipación. Si el nuevo domicilio está fuera de la cobertura, el contrato se dará por terminado sin responsabilidad para ninguna de las partes.",
    "DÉCIMA SEGUNDA" => "Los equipos son propiedad de \"CONECTWI\" y el suscriptor se compromete a no intervenirlos ni permitir que terceros lo hagan.",
    "DÉCIMA TERCERA" => "Si el suscriptor no paga en 5 días, se cortará el servicio y se aplicará un recargo de 50 pesos en su próxima factura. Después de 2 meses sin pago, se recogerán los equipos.",
    "DÉCIMA CUARTA" => "\"CONECTWI\" no se hace responsable por daños a equipos del suscriptor conectados al servicio de Internet.",
    "DÉCIMA QUINTA" => "Ambas partes aceptan que no existe error, dolo, violencia o mala fe en este contrato.",
    "DÉCIMA SEXTA" => "Este servicio es para uso residencial. Si se detecta uso comercial, el contrato será cancelado."
];

foreach ($clausulas as $titulo => $texto) {
    $pdf->SetFont('Arial', 'B', 11);
    $pdf->Write(7, utf8_decode($titulo . ".- ")); // Título en negritas, sin salto de línea

    $pdf->SetFont('Arial', '', 11);
    $pdf->Write(7, utf8_decode($texto)); // Texto normal, en la misma línea
    $pdf->Ln(10); // Espacio entre cláusulas
}

$pdf->Ln(10);
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, 'FIRMAS DE CONFORMIDAD', 0, 1, 'C');

$pdf->Ln(10);
$pdf->Cell(90, 7, '__________________________', 0, 0, 'C');
$pdf->Cell(90, 7, '__________________________', 0, 1, 'C');
$pdf->Cell(90, 7, 'LA EMPRESA "CONECTWI"', 0, 0, 'C');
$pdf->Cell(90, 7, 'EL CLIENTE', 0, 1, 'C');

$pdf->Output('I', 'contrato_conectwi.pdf');
?>