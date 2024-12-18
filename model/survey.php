<?php
    require_once "connection.php";

    $query = "SELECT * FROM survey WHERE active=1";
    $idAnswer = 0;
    try{
        $result = $connection->query($query);
        $survey = $result->fetch();
        $code = 200;
        $idSurvey = $survey['idSurvey'];
        $answers = "SELECT * FROM answers WHERE idSurvey=:idSurvey";
        $preparation = $connection->prepare($answers);
        $preparation->bindParam(":idSurvey", $idSurvey);
        try{
            $preparation->execute();
            $answer = $preparation->fetchAll();
            if(isset($_SESSION['user'])){
                $user = $_SESSION['user'];
                $idUser = $user['idUser'];
                $answ = "SELECT * FROM answersSurvey WHERE idUser=:idUser AND
                idSurvey=:idSurvey";
                $preparation2 = $connection->prepare($answ);
                $preparation2->bindParam(":idUser", $idUser);
                $preparation2->bindParam(":idSurvey", $idSurvey);
                try{
                    $preparation2->execute();
                    if($preparation2->rowCount() == 1){
                        $row = $preparation2->fetch();
                        $idAnswer = $row['idAnswer'];
                    }
                }
                catch(PDOException $e){
                    echo "Server error";
                }
            }   
        }
        catch(PDOException $e){
            echo "Server error";
        }
    }
    catch(PDOException $e){
        $code = 500;
        echo "Server error";
    }
?>