<?php
    $servername="localhost";
    $database="conectwi_conectwi";
    $username="conectwi_admin";
    $password="Conect#12345";
    
    //$servername="localhost";
    //$database="conectwi";
    //$username="root";
    //$password="";

    $conn= new mysqli ($servername,$username,$password,$database);     
    $conn->set_charset("utf8");
?>