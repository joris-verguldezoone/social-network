<?php

namespace App\Model;

class ConnectionModel extends Model
{
    public function registerGoogleUser($id_google, $login, $image, $connection)
    { // ce sera l'image en mignature 

        $sql = "INSERT INTO user_log (id_google, login, image, connection) VALUES (:id_google, :login, :image, :connection)";
        $result = $this->pdo->prepare($sql);
        $result->bindValue(':id_google', $id_google, \PDO::PARAM_STR);
        $result->bindValue(':login', $login, \PDO::PARAM_STR);
        $result->bindValue(':image', $image, \PDO::PARAM_STR);
        $result->bindValue(':connection', $connection, \PDO::PARAM_INT);
        $result->execute();
    }
}
