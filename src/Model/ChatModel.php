<?php

namespace App\Model;

class ChatModel extends Model
{

    public function asignGroup($hiddenID, $target_name, $img)
    {

        $result1 = $this->verifyGroup($hiddenID);
        $result2 = $this->verifyGroup($_SESSION['user']['sub']);
        var_dump($result1);
        var_dump($result2);

        $bool = true;
        foreach ($result1 as $value) {

            foreach ($result2 as $value2) {
                // var_dump($value['google_id']); // il affiche pas
                if ($value['id_group'] == $value2['id_group']) {
                    $bool = false;
                    var_dump($bool);
                    return var_dump('already exist');
                } else {
                    $bool = true;
                    var_dump($bool);
                }
            }
        }

        if ($bool == true) {

            $uniqIDGroup = uniqid();
            $convertStr = strval($hiddenID);
            $convertStr2 = strval($_SESSION['user']['sub']);
            $user_name = $_SESSION['user']['name'];
            $user_img = $_SESSION['user']['picture'];

            $sql = "INSERT INTO groups (google_id, id_group, name, img) VALUES (:hiddenID, :uniqIDGroup, :target_name, :img)";
            $result = $this->pdo->prepare($sql);
            $result->bindValue(":hiddenID", $convertStr, \PDO::PARAM_STR);
            $result->bindValue(":uniqIDGroup", $uniqIDGroup, \PDO::PARAM_STR);
            $result->bindValue(":target_name", $user_name, \PDO::PARAM_STR);
            $result->bindValue(":img", $user_img, \PDO::PARAM_STR);
            $result->execute();


            $sql2 = "INSERT INTO groups (google_id ,id_group, name, img) VALUES (:user_id, :uniqIDGroup, :target_name, :img)";
            $result2 = $this->pdo->prepare($sql2);
            $result2->bindValue(":user_id", $convertStr2, \PDO::PARAM_STR);
            $result2->bindValue(":uniqIDGroup", $uniqIDGroup, \PDO::PARAM_STR);
            $result2->bindValue(":target_name", $target_name, \PDO::PARAM_STR);
            $result2->bindValue(":img", $img, \PDO::PARAM_STR);
            $result2->execute();
            var_dump('group created');
        }
    }
    public function verifyGroup($user_id)
    {
        $sql = "SELECT * FROM groups WHERE google_id = :user_id";
        $result = $this->pdo->prepare($sql);
        $result->bindValue(':user_id', $user_id, \PDO::PARAM_STR);
        $result->execute();

        $fetch = $result->fetchAll(\PDO::FETCH_ASSOC);


        return $fetch;
    }
    public function fetch_groupChat($id_group)
    {
        $google_id = $_SESSION['user']['sub'];

        $sql = "SELECT * FROM groups WHERE id_group = :id_group AND google_id = :google_id";
        $result = $this->pdo->prepare($sql);
        $result->bindValue(':id_group', $id_group, \PDO::PARAM_STR);
        $result->bindValue(':google_id', $google_id, \PDO::PARAM_STR);

        $result->execute();

        $fetch = $result->fetchAll(\PDO::FETCH_ASSOC);

        // var_dump($fetch_group_identity);

        return $fetch;
    }
    public function sendMsg($id_group, $id_google, $content)
    {
        $tz_object = new \DateTimeZone('Europe/Paris');

        $date = new \DateTime();
        $date->setTimezone($tz_object);
        $date = $date->format('Y-m-d H:i:s');

        $sql = "INSERT INTO group_message (id_group, id_google, content, date) VALUES (:id_group, :id_google, :content, :date)";

        $result = $this->pdo->prepare($sql);
        $result->bindValue(":id_group", $id_group, \PDO::PARAM_STR);
        $result->bindValue(":id_google", $id_google, \PDO::PARAM_STR);
        $result->bindValue(":content", $content, \PDO::PARAM_STR);
        $result->bindValue(":date", $date, \PDO::PARAM_STR);

        // var_dump($date);

        $result->execute();
    }
    public function fetchConv($value)
    {
        $sql =  "SELECT * from group_message WHERE id_group = :value ORDER BY date ASC";
        $result = $this->pdo->prepare($sql);
        $result->bindValue(':value', $value, \PDO::PARAM_STR);
        $result->execute();
        $fetch = $result->fetchAll(\PDO::FETCH_ASSOC);

        return $fetch;
    }
}
