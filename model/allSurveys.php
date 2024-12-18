<?php
    require_once "connection.php";

    $data = "";
    $query = "SELECT s.question, a.answerText, COUNT(sa.idAnswer) AS count FROM answers a LEFT JOIN answerssurvey sa ON a.idAnswer=sa.idAnswer INNER JOIN survey s ON a.idSurvey=s.idSurvey GROUP BY a.idAnswer";
    try{
        $result = $connection->query($query)->fetchAll();
        $data = $result;
        $code = 200;
    }
    catch(PDOException $e){
        $data = "Server error";
        $code = 500;
    }
    echo json_encode($data);
    http_response_code($code);
?>