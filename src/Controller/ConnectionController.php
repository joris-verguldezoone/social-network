<?php

namespace App\Controller;

use App\Model\ConnectionModel;

class ConnectionController extends Controller
{
    /**
     * Permet de tester le formulaire de connexion ainsi que de se connecter si celui-ci est correct
     *
     * @param $login
     * @param $password
     * @return string|null
     */
    public function connect($login, $password)
    {
        $user_login = $login;
        $user_password = $password;
        $errorLog = null;

        if (!empty($user_login) && !empty($password))
        {
            $login = $this -> secure($user_login);
            $password = $this -> secure($user_password);

            $connectionModel = new ConnectionModel();

            $result = $connectionModel -> checkOneValue('user_log', 'login', $login);
            if ($result)
            {
                $check_password = $connectionModel -> checkPassword($login);

                if (password_verify($password, $check_password['password']))
                {
                    $_SESSION['connected'] = true;
                    $user = $connectionModel -> selectAll('user_log', 'login', $login);
                    $_SESSION['user'] = $user;
                    setcookie("connexionCookie", json_encode($user));
                        var_dump($_COOKIE['connexionCookie']);
                    $data = json_decode($_COOKIE['connexionCookie'], true);
                    var_dump($data);
                    //$this -> redirect('profil');
                    echo ('bravo ! t\'es connecté !'); // a supprimer et enlever les comments de la ligne au dessus
                } else {
                    $errorLog = '<p>Erreur : Mot de passe incorrect.</p>';
                }
            } else {
                $errorLog = '<p>Erreur : Identifiant incorrect.</p>';
            }
        } else {
            $errorLog = '<p>Erreur : Veuillez remplir le formulaire.</p>';
        }
        return $errorLog;
    }
}