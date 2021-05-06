<?php

namespace App\Controller;

class InscriptionController extends Controller
{
    /**
     * Effectue une série de vérification permettant la création d'un utilisateur si celle-ci sont correctes
     *
     * @param $login
     * @param $email
     * @param $password
     * @param $confirm_password
     */
    public function register($login, $email, $password, $confirm_password)
    {
        $model_inscription = new \App\Model\InscriptionModel();

        $login = $this -> secure($login);
        $email = $this -> secure($email);
        $password = $this -> secure($password);
        $confirm_password = $this -> secure($confirm_password);

        $errorLog = null;

        if (!empty($login) && !empty($email) && !empty($password) && !empty($confirm_password))
        {
            $login_len = strlen($login);
            $email_len = strlen($email);
            $password_len = strlen($password);
            $confirm_password_len = strlen($confirm_password);

            if (($login_len >= 2) && ($email_len >= 7) && ($password_len >= 3) && ($confirm_password_len >= 3))
            {
                if (($login_len <= 30) && ($email_len <= 30) && ($password_len <= 30) && ($confirm_password_len <= 30))
                {
                    $login_exist = $model_inscription -> alreadyExist('user_log', 'login', $login);
                    $email_exist = $model_inscription -> alreadyExist('user_log', 'email', $email);

                    if (!$login_exist)
                    {
                        if (!$email_exist)
                        {
                            if ($confirm_password == $password)
                            {
                                $crypted_password = password_hash($password, PASSWORD_BCRYPT);
                                $model_inscription -> createAccount($login, $email, $crypted_password);

                                $this -> redirect('connection');
                            } else {
                                $errorLog = ('<p>Erreur ! Vérification du mot de passe incorrect.</p>');
                            }
                        } else {
                            $errorLog = ('<p>Email déjà utilisé.</p>');
                        }
                    } else {
                        $errorLog = ('<p>Login déjà utilisé.</p>');
                    }
                } else {
                    $errorLog = ('<p>Erreur d\'informations ! limites des 30 caractères maximum atteintes.</p>');
                }
            } else {
                $errorLog = ('<p>Erreur d\'informations ! Login : 2 caractères minimum | Mot de passe : 3 caractères minimum | Email : 7 caractères minimum.</p>');
            }
        } else {
            $errorLog = ('<p>Veuillez remplir le formulaire.</p>');
        }

        echo $errorLog;
    }
}