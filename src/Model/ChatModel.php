<?php

namespace App\Model;

class ChatModel extends Model
{

    public function asignGroup($hiddenID, $target_name)
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
            $sql = "INSERT INTO groups (google_id, id_group) VALUES (:hiddenID, :uniqIDGroup)";
            $result = $this->pdo->prepare($sql);
            $result->bindValue(":hiddenID", $convertStr, \PDO::PARAM_STR);
            $result->bindValue(":uniqIDGroup", $uniqIDGroup, \PDO::PARAM_STR);
            $result->execute();

            $convertStr2 = strval($_SESSION['user']['sub']);

            $sql2 = "INSERT INTO groups (google_id ,id_group) VALUES (:user_id, :uniqIDGroup)";
            $result2 = $this->pdo->prepare($sql2);
            $result2->bindValue(":user_id", $convertStr2, \PDO::PARAM_STR);
            $result2->bindValue(":uniqIDGroup", $uniqIDGroup, \PDO::PARAM_STR);
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
}
