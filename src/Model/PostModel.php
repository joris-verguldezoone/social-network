<?php


namespace App\Model;


class PostModel extends Model
{
    //requete qui gerent les posts

    public function newPost($id_google, $contenu)
    {
        $tz_object = new \DateTimeZone('Europe/Paris');

        $date = new \DateTime();
        $date->setTimezone($tz_object);
        $date = $date->format('Y-m-d H:i:s');


        $query = $this->pdo->prepare("INSERT INTO posts (id_google, contenu, date) VALUES (:id_google, :content, :date)");
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

        $query = $this->pdo->prepare('SELECT u.*, p.* FROM user_log as u INNER JOIN posts as p ON u.id_google = p.id_google WHERE u.id_google = :value ORDER by date DESC');
        $query->bindValue(':value', $value, \PDO::PARAM_STR);
        $query->execute();

        return $query->fetchAll(\PDO::FETCH_ASSOC);
    }
}
