<?php
$servername="localhost";
$dbname="graph";
//$dbname="temphumid";
$username="root";
$password="";

try{
    $db=new PDO("mysql:host=$servername;dbname=$dbname",$username,$password);
    //echo "success connexion";
    
}
catch (PDOexeption $e){
    //echo"not connected"+$e->getMessage();
 
}

