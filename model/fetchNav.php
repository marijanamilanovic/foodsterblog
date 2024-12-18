<?php
    session_start();
    require_once "connection.php";

    $data = "";

    if(isset($_SESSION['user'])){
        $user = $_SESSION['user'];
        if($user['idRole'] == 1){
            $display = 2;
        }
        else{
            $display = 1;
        }
    }
    else{
        $display = 3;
    }

    $query = "SELECT * FROM nav WHERE display=0";

    if($display == 3){
        //neautorizovan korisnik
        $query .= " OR display=3";
    }
    else if($display == 2){
        //admin
        $query .= " OR display=2 OR display=1";
    }
    else{
        //ulogovan korisnik
        $query .= " OR display=1";
    }

    $query .= " ORDER BY priority";
    
    try{
        $nav = $connection->query($query)->fetchAll();
        $data = $nav;
        $code = 200;
    }
    catch(PDOException $e){
        $code = 500;
        $data = "Server error";
    }
    echo json_encode($data);
    http_response_code($code);
?>