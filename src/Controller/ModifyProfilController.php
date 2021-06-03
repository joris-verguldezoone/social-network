<?php

namespace App\Controller;

class ModifyProfilController extends Controller
{
    public function newProfilPicture()
    {
        if (isset($_FILES['avatar']) and !empty($_FILES['avatar']['name']))
        {
            $lengthMax = 5000000;
            $validExt = array('jpg', 'jpeg', 'gif', 'png');

            if ($_FILES['avatar']['size'] <= $lengthMax)
            {
                $uploadExt = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));

                if (in_array($uploadExt, $validExt))
                {
                    $date = date("Y-m-d_H:i:s");
                    $correctDate = str_replace(':', '-', $date);

                    $path = "upload/" . $_SESSION['user']['family_name'] . "_" . $correctDate . "." . $uploadExt;
                    move_uploaded_file($_FILES['avatar']['tmp_name'], $path);
                    $_SESSION['user']['picture'] = $path;
                    echo ("Modification de votre photo de profil avec succès.");
                } else {
                    echo ("Votre photo de profil doit être au bon format <i>(jpg, jpeg, gif ou png)</i>.");
                }
            } else {
                echo ("Votre photo de profil ne doit pas dépasser 5Mo.");
            }
        }
    }
}