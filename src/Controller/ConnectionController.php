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
    public function connect($id, $login)
    {
        $user_login = $login;
        $errorLog = null;

        if (!empty($user_login))
        {
            $login = $this -> secure($user_login);

            $connectionModel = new ConnectionModel();

            $result = $connectionModel -> checkOneValue('user_log', 'id_google', $id);
            if ($result)
            {
                $check_password = $connectionModel -> checkPassword($login);

                
                    $_SESSION['connected'] = true;
                    $user = $connectionModel -> selectAll('user_log', 'id_google', $id);
                    $_SESSION['user'] = $user;
                    // setcookie("connexionCookie", json_encode($user));
                    //     var_dump($_COOKIE['connexionCookie']);
                    // $data = json_decode($_COOKIE['connexionCookie'], true);
                    // var_dump($data);
                    //$this -> redirect('profil');
                    echo ('bravo ! t\'es connecté !'); // a supprimer et enlever les comments de la ligne au dessus
            } else {
                $errorLog = '<p>Erreur : Identifiant incorrect.</p>';
            }
        }
        return $errorLog;
    }
}