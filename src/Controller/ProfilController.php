<?php

namespace App\Controller;

use App\Model\ProfilModel;

class ProfilController extends Controller
{
    public function modifyProfil($login, $email, $password, $confirm_password)
    {
        $login = $this -> secure($login);
        $email = $this -> secure($email);
        $password = $this -> secure($password);
        $confirm_password = $this -> secure($confirm_password);

        $errorLog = null;

        $login_len = strlen($login);
        $email_len = strlen($email);
        $password_len = strlen($password);
        $confirm_password_len = strlen($confirm_password);

        $modelProfil = new ProfilModel();

        if (isset($_FILES['file']))
        {
            $tmp_name = $_FILES['file']['tmp_name'];
            $name = $_FILES['file']['name'];
            $size = $_FILES['file']['size'];
            $error = $_FILES['file']['error'];

            $ext = explode('.', $name);
            $extension = strtolower(end($ext));
            $all_extensions = ['jpg', 'png', 'jpeg', 'svg', 'gif'];
            $max_size = 2000000;

            if (in_array($extension, $all_extensions) && $size <= $max_size && $error == 0)
            {
                $unique_name = uniqid('', true);
                $file = $unique_name . "." . $extension;

                move_uploaded_file($tmp_name, './upload/' . $file);
                $modelProfil -> insertPhoto($file);
                $modelProfil -> getPhoto();

                echo ('<p>Modification enregistrées</p>');
            } else {
                echo ('<p>Une erreur est survenue</p>');
            }
        }

        if (!empty($login))
        {
            if ($login_len >= 2)
            {
                if ($login_len <= 30)
                {
                    $new_login = $modelProfil -> alreadyExist('user_log', 'login', $login);

                    if (!$new_login)
                    {
                        $modelProfil -> updateOneValue('user_log', 'login', 'id', $login, $_SESSION['user']['id']);

                        $infoUser = $modelProfil -> selectAll('user_log', 'id', $_SESSION['user']['id']);
                        $_SESSION['user'] = $infoUser;

                        echo ('<p>Modification du profil effectué(s). (login)</p>');
                    } else {
                        $errorLog = ('<p>Erreur : Login déjà existant !</p>');
                    }
                }
            }
        }

        if ((!empty($password)) && (!empty($confirm_password)))
        {
            if (($confirm_password_len >= 5) && ($password_len >= 5))
            {
                if (($confirm_password_len <= 30) && ($password_len <= 30))
                {
                    if ($password == $confirm_password)
                    {
                        $crypted_password = password_hash($password, PASSWORD_BCRYPT);

                        $modelProfil -> updateOneValue('user_log', 'password', 'id', $crypted_password, $_SESSION['user']['id']);

                        $infoUser = $modelProfil -> selectAll('user_log', 'id', $_SESSION['user']['id']);
                        $_SESSION['user'] = $infoUser;

                        echo ('<p>Modification du profil effectué(s). (mot de passe)</p>');
                    } else {
                        $errorLog = ('<p>Erreur : Confirmation du mot de passe incorrect !</p>');
                    }
                }
            }
        }

        if (!empty($email))
        {
            if ($email_len >= 7)
            {
                if ($email_len <= 30)
                {
                    $new_email = $modelProfil -> alreadyExist('user_log', 'email', $email);

                    if (!$new_email)
                    {
                        $modelProfil -> updateOneValue('user_log', 'email', 'id', $email, $_SESSION['user']['id']);

                        $infoUser = $modelProfil -> selectAll('user_log', 'id', $_SESSION['user']['id']);
                        $_SESSION['user'] = $infoUser;

                        echo ('<p>Modification du profil effectué(s). (email)</p>');
                    } else {
                        $errorLog = ('<p>Erreur : Cet email est déjà existant !</p>');
                    }
                }
            }
        }

        return $errorLog;
    }
}