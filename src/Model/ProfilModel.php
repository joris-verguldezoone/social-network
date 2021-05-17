<?php

namespace App\Model;

class ProfilModel extends Model
{
    public function insertPhoto($file)
    {
        $query = $this -> pdo -> prepare('UPDATE user_log SET profil_image = ? WHERE id = ?');
        $query -> execute([$file, $_SESSION['user']['id']]);
    }

    public function getPhoto()
    {
        $query = $this -> pdo -> prepare('SELECT profil_image FROM user_log  WHERE id = ?');
        $query -> execute([$_SESSION['user']['id']]);

        while ($data = $query -> fetch())
        {
            echo ("<img src='./upload/" . $data['profil_image'] . "' width='200px'>");
        }
    }
}