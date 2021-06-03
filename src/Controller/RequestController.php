<?php

namespace App\Controller;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class RequestController extends Controller
{

    public function autocomplete_user($request,  $response, $args)
    {
        $method = $request->getMethod();
        $letter = $_POST['letter'];
        $model = new \App\Model\RequestModel;

        $result = $model->autocomplete_user_login($letter);
        // $this->preloadTwig();
        // header("Content-Type: application/json");

        $response->getBody($result); // write json encodé

        return $response;
    }
}
