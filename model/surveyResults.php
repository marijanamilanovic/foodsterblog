<?php
    require_once "connection.php";

    $data = "";
    $code = 200;
    if(isset($_POST['result'])){
        $idSurvey = $_POST['survey'];
        $query = "SELECT a.answerText, COUNT(sa.idAnswer) AS count FROM answers a INNER JOIN answerssurvey sa ON a.idAnswer=sa.idAnswer WHERE a.idSurvey=:idSurvey GROUP BY a.answerText";
        $preparation = $connection->prepare($query);
        $preparation->bindParam(":idSurvey", $idSurvey);
        try{
            $preparation->execute();
            if($preparation->rowCount() != 0){
                $data = $preparation->fetchAll();
                $code = 200;
            }
        }
        catch(PDOException $e){
            $code = 500;
            $data = "Server error";
        }
    }
    else{
        $data = "Error";
        $code = 404;
    }
       
    echo json_encode($data);
    http_response_code($code); 
?>