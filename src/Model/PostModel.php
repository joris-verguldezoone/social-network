<?php


namespace App\Model;


class PostModel extends Model
{
    //requete qui gerent les posts

    public function newPost($id_google, $contenu, $date)
    {
        $query = $this->pdo->prepare("INSERT INTO posts (id_google, contenu, date, nb_like, nb_comment) VALUES (:id_google, :content, :date, 0, 0)");
        $query->bindValue(':id_google', $id_google);
        $query->bindValue(':content', $contenu);
        $query->bindValue(':date', $date);

        $query->execute();
    }

    public function getAllPosts(): array
    {
        $query = $this->pdo->prepare("SELECT u.*, p.* FROM user_log as u INNER JOIN posts as p ON u.id_google = p.id_google ORDER by date DESC");
        $query->execute();

        return $query->fetchAll();
    }

    public function selectAllPosts($value): array
    {
        $query = $this->pdo->prepare('SELECT u.*, p.* FROM user_log as u INNER JOIN posts as p ON u.id_google = p.id_google ORDER by date DESC WHERE u.id_google = :value');
        $query->bindValue(':value', $value, \PDO::PARAM_STR);
        $query->execute([$value]);

        return $query->fetchAll(\PDO::FETCH_ASSOC);
    }
}
