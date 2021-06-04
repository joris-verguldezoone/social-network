<?php

namespace App\Model;

class ModifyProfilModel extends Model
{
    public function insertBackgroundProfil()
    {
        $background_profil = 'View/images/default_background.png';

        $query = $this -> pdo -> prepare('UPDATE user_log SET image_background = :img_bg');
        $query -> bindValue(':img_bg', $background_profil);

        $query -> execute();
    }
}