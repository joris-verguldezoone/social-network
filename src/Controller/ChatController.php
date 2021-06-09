<?php

namespace App\Controller;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ChatController extends Controller
{

    public function sendMessage(Request $request, Response $response, $args)
    {
        // check si la room existe,
        // creer ou sauter l'étape de la room
        // sendMsg 
        $img = $_POST['user_img'];
        $method = $request->getMethod();
        if ($method == 'POST') {
            // $msg = $_POST['msg'];
            $id = $_POST['hiddenID'];
            $target_name = $_POST['target_name'];
            $params = (array)$request->getParsedBody();
            $model = new \App\Model\ChatModel();
            $result = $model->asignGroup($id, $target_name, $img);
            // $model->sendMsg($msg, $group)
        }

        $this->preloadTwig();
        $response->getBody($result);
        return $response;
    }
    public function loadConversation(Request $request, Response $response, $args)
    {
        $userID = $_SESSION['user']['sub'];
        $model = new \App\Model\ChatModel;
        $result = $model->fetchOneValueCol('groups', 'google_id', $userID);

        $this->preloadTwig();
        // var_dump($result);

        $result = json_encode($result);

        $response->getBody()->write($result); // write json encodé

        return $response->withHeader('Content-Type', 'application/json');
        // ->withHeader('Content-Type', 'application/json');
    }
    public function fetchConversation(Request $request, Response $response, $args)
    {
        $group_id = $_POST["hidden_group_id"];

        $model = new \App\Model\ChatModel;
        $result1 = $model->fetch_groupChat($group_id);
        $this->preloadTwig();
        // $result1 = json_encode($result1);

        $result2 = $model->fetchOneValueCol('group_message', 'id_group', $group_id);

        // $result2 = json_encode($result2);

        $result = [$result1, $result2];

        $result = json_encode($result);

        $response->getBody()->write($result); // write json encodé


        return $response->withHeader('Content-Type', 'application/json');
    }
    public function sendMessages(Request $request, Response $response, $args)
    {
        $group_id = $_POST["hidden_group_id"];
        $content = $_POST['msg_content'];
        $id_google = $_SESSION['user']['sub'];
        $name_group = $_POST['name_group'];

        // id id_google id_group name type


        $model = new \App\Model\ChatModel;
        $isConnected = $model->alreadyExist('user_log', 'connection', $_SESSION['user']['sub']);



        if ($isConnected == 0) {
            $result = $model->sendMsg($group_id, $id_google, $content);
            $model->insertNotif($id_google, $group_id, $name_group, 'message');
        } else {

            $result = $model->sendMsg($group_id, $id_google, $content);
        }

        $result = $model->sendMsg($group_id, $id_google, $content);
        $response->getBody(); // write json encodé

        return $response->withHeader('Content-Type', 'application/json');
    }
}
