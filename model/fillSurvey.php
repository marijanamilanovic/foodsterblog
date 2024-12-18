<?php
    session_start();
    require_once "connection.php";

    $data="";

    if(isset($_POST['send'])){
        if(isset($_SESSION['user'])){
            $idSurvey = $_POST['survey'];
            $answ = $_POST['choice'];
            $user = $_SESSION['user'];
            $idUser = $user['idUser'];
            $query = "INSERT INTO answerssurvey VALUES (NULL, :idAnswer, :idSurvey, :idUser)";
            $preparation = $connection->prepare($query);
            $preparation->bindParam(":idAnswer", $answ);
            $preparation->bindParam(":idSurvey", $idSurvey);
            $preparation->bindParam(":idUser", $idUser);
            try{
                $preparation->execute();
                $code = 201;
                $data = "Thank you for voting!";
            }
            catch(PDOException $e){
                $code = 500;
                $data = "Server error";
            }
        }
        else{
            $code = 200;
            $data = "You have to log in to vote!";
        }
    }
    else{
        $code = 404;
    }
    echo json_encode($data);
    http_response_code($code);
?>