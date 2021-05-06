<?php

namespace App\Model;

class ConnectionModel extends Model
{
    /**
     * Permet la vérification d'un mot de passe
     *
     * @param $login
     * @return mixed
     */
    public function checkPassword($login)
    {
        $query = $this -> pdo -> prepare('SELECT password FROM user_log WHERE login = :login');
        $query -> bindValue(':login', $login);
        $query -> execute();

        return $query -> fetch(\PDO::FETCH_ASSOC);
    }
}