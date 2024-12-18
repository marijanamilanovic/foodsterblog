<?php
    require_once "connection.php";

    $data = "";
    $id = $_POST['id'];
    $query = "UPDATE survey SET active=0";

    try{
        $connection->query($query);
        $setActive = "UPDATE survey SET active=:active WHERE idSurvey=:id";
        $active = 1;
        $preparation = $connection->prepare($setActive);
        $preparation->bindParam(":id", $id);
        $preparation->bindParam(":active", $active);
        try{
            $preparation->execute();
            $data = "Survey activity has changed!";
            $code = 200;
        }
        catch(PDOException $e){
            $data = "Server error";
            $code = 500;
        }
    }
    catch(PDOException $e){
        $code = 500;
        $data = "Server error";
    }

    echo json_encode($data);
    http_response_code($code);
?>