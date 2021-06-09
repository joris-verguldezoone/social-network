<?php

namespace App\Model;

class ModifyProfilModel extends Model
{
    public function getAllInfoUser($id_google)
    {
        $query = $this -> pdo -> prepare('SELECT * FROM user_log WHERE id_google = :id_google');
        $query -> bindValue(':id_google', $id_google);

        $query -> execute();
        return $query -> fetch();
    }

    public function insertProfilpicture($picture, $id_google)
    {
        $query = $this -> pdo -> prepare('UPDATE user_log SET image = :img WHERE id_google = :id_google');
        $query -> execute([
            'img' => $picture,
            'id_google' => $id_google
        ]);
    }

    public function insertBackgroundProfil($background_profil)
    {
        $query = $this -> pdo -> prepare('UPDATE user_log SET image_background = :img_bg');
        $query -> bindValue(':img_bg', $background_profil);

        $query -> execute();
    }
}