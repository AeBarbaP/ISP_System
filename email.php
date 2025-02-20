<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'email/Exception.php';
require 'email/PHPMailer.php';
require 'email/SMTP.php';

    $nombre = $_POST['nombre'];
    $email = $_POST['emailT'];
    $mensaje = $_POST['mensaje'];

    $miCorreo = "contacto@conectwi.com";

    $mail = new PHPMailer(true);

    try {
        //Server settings
        $mail->SMTPDebug = 0;                                       // Enable verbose debug output
        $mail->isSMTP();                                            // Set mailer to use SMTP
        //$mail->Host       = 'smtp.gmail.com';  // Specify main and backup SMTP servers
        $mail->Host       = 'mail.conectwi.com';  // Specify main and backup SMTP servers
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = 'contacto@conectwi.com';                     // SMTP username
        $mail->Password   = 'Con74ct0.25';                               // SMTP password
        $mail->SMTPSecure = 'TLS';                                  // Enable TLS encryption, `ssl` also accepted
        $mail->Port       = 587;                                    // TCP port to connect to 587

        //Recipients
        $mail->setFrom('contacto@conectwi.com', 'MENSAJE DE USUARIO');
        $mail->addAddress($miCorreo, $nombre);     // Add a recipient

        // Content
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';                                  // Set email format to HTML
        $mail->Subject = 'MENSAJE DE USUARIO';
        $mail->Body    = 'El usuario '.$nombre.' envió el siguiente mensaje:<br><br> '.$mensaje.'<br><br>'.$email;
        $mail->AltBody = 'Mensaje usuario.';

        // $mail->send();

        if($mail->send()){
            echo json_encode(
                array(
                   'success'=>1
                ));
        }
        else {
            echo json_encode(
                array(
                    'success'=>0
                ));
        }

    } catch (Exception $e) {
        echo "Error al enviar mensaje. Mailer Error: {$mail->ErrorInfo}";
        // echo $email;
        
    }



?>