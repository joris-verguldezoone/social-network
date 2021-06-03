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
        $method = $request->getMethod();
        if ($method == 'POST') {
            // $msg = $_POST['msg'];
            $id = $_POST['hiddenID'];
            $target_name = $_POST['target_name'];
            $params = (array)$request->getParsedBody();
            $model = new \App\Model\ChatModel();
            $result = $model->asignGroup($id, $target_name);
            // $model->sendMsg($msg, $group)
        }

        $this->preloadTwig();
        $response->getBody($result);
        return $response;
    }
    public function loadConversation()
    {
    }
}
