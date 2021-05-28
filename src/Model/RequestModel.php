<?php

namespace App\Model;

class RequestModel extends Model
{

    public function autocomplete_user_login()
    {

        $letter1 = "%" . $_POST['letter'] . "%";

        $sql = "SELECT id_google,login, image FROM user_log WHERE login LIKE :letter1";
        $result = $this->pdo->prepare($sql);
        $result->bindValue(":letter1", $letter1, \PDO::PARAM_STR);
        // $result->bindValue(":letter2", $letter2, \PDO::PARAM_STR);
        $result->execute();
        $tab = array();
        $i = 0;

        while ($fetch = $result->fetch(\PDO::FETCH_ASSOC)) {
            $tab[$i][] = $fetch;
            $i++;
        }


        echo json_encode($tab);
        // echo json_encode($tableau);
    }
}
