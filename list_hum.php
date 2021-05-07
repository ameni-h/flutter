<?php
    include "db.php";
    $query=$db->prepare('select id,humidity,date from dht11');
    $query->execute();
    if ($query->rowCount()>0) {
    	$data=$query->fetchAll(PDO::FETCH_ASSOC);
    	echo json_encode($data);
    }
    /*else{
    	$json['success']=0;
    	$json['myintro']='';
    	$json['message']='no data found';
    	echo json_encode($json);
    }*/
    ?>
