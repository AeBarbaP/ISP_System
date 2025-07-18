<?php
    $servername="localhost";
    $database="conectwi_conectwi"; //solo se quit贸 para conexi贸n remota
    $username="conectwi_admin";
    $password="Conect#12345";

    //$servername="localhost";
    //$database="conectwi"; //solo se quitó para conexión remota
    //$username="root";
    //$password="";

    $conn= new mysqli ($servername,$username,$password,$database);     
    $conn->set_charset("utf8");

?>