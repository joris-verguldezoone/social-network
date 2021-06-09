<?php

namespace App\Controller;

// use App\Model\ConnectionModel;
require('Controller.php');

use App\Model\ModifyProfilModel;
use Google\Client;
use Model\ConnectionModel;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

var_dump(__DIR__);
// require '../../vendor/google/apiclient/src/Client.php';
// require '../../vendor/google/apiclient/src/AccessToken/Verify.php';

class GoogleController extends Controller
{
    public function dumb(Request $request, Response $response, $args)
    {
        echo 'coucou';

        $this->preloadTwig();
        $response->getBody()->write($this->twig->render(
            'connection.twig',
            [
                ['BASE_PATH' => BASE_PATH, "HTTP_HOST" => HTTP_HOST]
            ]
        ));
        return $response;
    }
    public function donkey(Request $request, Response $response, $args)
    {
        $this->preloadTwig();

        $id_token = $_POST['token'];
        // $model = new \App\Model\RequestModel;
        $clientID = '715843356551-u92it250uv3rljvhk0jdfkck5qmmm9m8.apps.googleusercontent.com';
        // $client = new Google_Client();

        $client = new Client(['client_id' => $clientID]);
        $payload = $client->verifyIdToken($id_token);
        if ($payload) {
            // $userid = $payload['sub'];
            // $userEmail = $payload['email'];
            // $email = $payload['name'];
            // $picture = $payload['picture'];
        } else {
            echo 'invalid token id';
        }

        // $this->twig->addGlobal('user_info', $payload);
        $model = new \App\Model\ConnectionModel;
        $fetchInfoUser = new ModifyProfilModel();

        $alreadyExist = $model->alreadyExist('user_log', 'id_google', $payload['sub']);
        if (!$alreadyExist) {

            $model->registerGoogleUser($payload['sub'], $payload['name'], $payload['picture'], 1);
        } else {
            $allInfo = $fetchInfoUser->getAllInfoUser($payload['sub']);
            // $_SESSION['user']['picture'] = $allInfo['image'];
            // var_dump($_SESSION);
            $payload['picture'] = $allInfo['image'];
            // var_dump($allInfo['image']);
            $_SESSION['user'] = $payload;
            $id = $_SESSION['user']['sub'];

            $model->updateOneValue('user_log', 'connection', 'id_google', 1, $id);
        }

        return $response;
    }
    public function isConnected(Request $request, Response $response, $args)
    {
        $method = $request->getMethod();
        if ($method == 'POST') {

            $params = (array)$request->getParsedBody();
            $isConnected = $_SESSION['user']['sub'];
        } else {
            $isConnected = "";
        }

        $this->preloadTwig();
        $response->getBody()->write($this->twig->render(
            'connection.twig',
            [
                'BASE_PATH' => BASE_PATH, "HTTP_HOST" => HTTP_HOST, 'method' => $method, 'isConnected' => $isConnected
            ]
        ));
        return $response;
    }
}
