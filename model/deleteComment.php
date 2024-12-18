<?php
    require_once "connection.php";

    if(isset($_POST['button'])){
        $id = $_POST['idComment'];
        $data = "";
        $query = "DELETE FROM comments WHERE idComment=:idComment";
        $preparation = $connection->prepare($query);
        $preparation->bindParam(":idComment", $id);
        try{
            $preparation->execute();
            $data = "Comment deleted!";
            $code = 200;
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