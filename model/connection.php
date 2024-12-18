<?php
    require_once "parameters.php";
    try{
        $connection = new PDO("mysql:host=$host;dbname=$database", $user, $pass, array(PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES 'utf8' COLLATE 'utf8_unicode_ci'"));
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (PDOException $e){
        echo $e->getMessage();
    }
?>