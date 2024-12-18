<?php
    require_once "connection.php";

    $answer = $_POST['answer'];
    $question = $_POST['question'];
    $data = "";
    $code = 200;
    $active = 0;
    $error = 0;
    $count = 1;

    $reQuestion = "/^[A-Z][a-z]+\s[a-z]+$/";
    $reAnswer = "/^[A-Z][a-z]+\s[a-z]+$/";
    if(!preg_match($reQuestion, $question)){
        $data = "Question must begin with capital letter and have minimum 2 words.";
        $error++;
    }
    foreach($answer as $a){
        if(!preg_match($reQuestion, $a)){
            $data = "Answer must begin with capital letter and have minimum 2 words, answer $count is not well formated.";
            $error++;
        }
        $count++;
    }
    if($error == 0){
        $query = "INSERT INTO survey VALUES (null, :question, :active)";
        $preparation = $connection->prepare($query);
        $preparation->bindParam(":question", $question);
        $preparation->bindParam(":active", $active);

        try{
            $preparation->execute();
            $id = $connection->lastInsertId();
            foreach($answer as $a){
                $query2 = "INSERT INTO answers VALUES (null, :text, :idSurvey)";
                $preparation2 = $connection->prepare($query2);
                $preparation2->bindParam(":text", $a);
                $preparation2->bindParam(":idSurvey", $id);
                try{
                    $preparation2->execute();
                    $data = "Survey successfully added!";
                    $code = 201;
                }
                catch(PDOException $e){
                    $code = 500;
                    $data = "Server error";
                }
            }
        }
        catch(PDOException $e){
            $code = 500;
            $data = "Server error";
        }
    }

    echo json_encode($data);
    http_response_code($code);
?>