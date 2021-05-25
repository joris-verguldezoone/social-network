<?php

namespace App\Controller;

// use App\Model\ConnectionModel;
require('Controller.php');

use Google_Client;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class GoogleController extends Controller
{

    public function __construct()
    {
        echo 'dota';
    }
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

        var_dump($_POST);

        //    $name =  $_POST['name'];
        //    var_dump($_POST['name']);
        // $image = $_POST['image'];
        //    $test = $id;
        // .'<br />'. $name .'<br />'. $image .'successss'
        //    return json_encode($_GET['id']);

        // $bool = alreadyExist('user', "id_google", $id);

        // if($bool){
        //     $connectionController = new ConnectionController();
        //     $connectionController->connect('')
        // }
        // else{
        //     $inscriptionController = new InscriptionController();
        //     $inscriptionController->register($id, $name)
        // }
        //    var_dump($_GET['id']);
        return $response;
    }
    public function donkey(Request $request, Response $response, $args)
    {

        $id_token = $_POST['token'];

        $clientID = '715843356551-u92it250uv3rljvhk0jdfkck5qmmm9m8.apps.googleusercontent.com';
        // $client = new Google_Client();
        $client = new Google_Client(['client_id' => $clientID]);
        $payload = $client->verifyIdToken($id_token);
        if ($payload) {
            $userid = $payload['sub'];
        } else {
            echo 'invalid token id';
        }
        return $response;
    }
}
