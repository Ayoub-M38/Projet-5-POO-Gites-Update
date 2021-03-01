<?php

class Database
{

    public function getPDO(){
        $user = "root";
        $pass = "";
        try{
            $db = new PDO("mysql:host=localhost;dbname=phpmvc;charset=utf8", $user, $pass);
            echo "<p class='alert-success p-2'>CONNEXION A MYSQL</p>";
            return $db;
        }catch (PDOException $e){
            echo "Erreur de connexion : " .$e->getMessage();
        }
    }
}