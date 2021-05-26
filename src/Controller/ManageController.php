<?php

namespace App\Controller;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ManageController extends Controller
{
    /**
     * Charge et affichage home.twig
     *
     * @param Request $request
     * @param Response $response
     * @param $args
     * @return Response
     */
    public function home(Request $request, Response $response, $args)
    {
        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render('home.twig'));
        return $response;
    }

    public function showProfil(Request $request, Response $response, $args)
    {
        $test = new profilController();
        $test -> testProfil();

        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render('profil.twig'));
        return $response;
    }

    public function modifyProfil(Request $request, Response $response, $args)
    {
        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render('modifyProfil.twig'));
        return $response;
    }

    public function chat(Request $request, Response $response, $args)
    {
        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render('chat.twig'));
        return $response;
    }
}