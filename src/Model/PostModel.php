<?php


namespace App\Model;


class PostModel extends Model
{
    //requete qui gerent les posts

    public function newPost($id_google, $contenu, $date)
    {
        $query = $this -> pdo -> prepare("INSERT INTO posts (id_google, contenu, date, nb_like, nb_comment) VALUES (:id_google, :content, :date, 0, 0)");
        $query -> bindValue(':id_google', $id_google);
        $query -> bindValue(':content', $contenu);
        $query -> bindValue(':date', $date);

        $query -> execute();
    }
}