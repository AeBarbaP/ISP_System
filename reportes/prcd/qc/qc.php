<?php
    $servername="localhost";
    $database="suidevdb"; //solo se quitó para conexión remota
    $username="root";
    $password="";

    $conn= new mysqli ($servername,$username,$password,$database); 
    $conn->set_charset("utf8");

?>