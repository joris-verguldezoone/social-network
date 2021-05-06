<?php

namespace App\Model;

class InscriptionModel extends Model
{
    /**
     * Permet la création d'un utilisateur
     *
     * @param $login
     * @param $email
     * @param $password
     */
    public function createAccount($login, $email, $password)
    {
        $query = $this -> pdo -> prepare('INSERT INTO user_log (login, email, password) VALUES (:login, :email, :password)');
        $query -> bindValue(':login', $login);
        $query -> bindValue(':email', $email);
        $query -> bindValue(':password', $password);

        $query -> execute();
    }
}