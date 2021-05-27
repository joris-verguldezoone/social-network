<?php

namespace App\Model;

class profilModel extends Model
{
    public function getProfil()
    {
        $query = $this->pdo->prepare('SELECT * FROM utilisateur');
        $query->execute();

        $result = $query->fetch();
        $_SESSION['utilisateur'] = $result;
    }
}
