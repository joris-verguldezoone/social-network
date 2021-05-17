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
    public function main(Request $request, Response $response, $args)
    {
        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render('home.twig'));
        return $response;
    }

    /**
     * Vérifie, charge et affiche inscription.twig
     *
     * @param Request $request
     * @param Response $response
     * @param $args
     * @return Response
     */
    public function inscription(Request $request, Response $response, $args)
    {
        $method = $request -> getMethod();
        if ($method == 'POST')
        {
            $params = (array)$request -> getParsedBody();

            $login = $params['createLogin'];
            $email = $params['createEmail'];
            $password = $params['createPassword'];
            $confirm_password = $params['confirmCreatePassword'];

            $InscriptionController = new \App\controller\InscriptionController();
            $InscriptionController -> register($login, $email, $password, $confirm_password);
        } else {
            $login = '';
            $email = '';
            $password = '';
            $confirm_password = '';
        }

        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render(
            'inscription.twig',
            [
                'BASE_PATH' => BASE_PATH,
                "HTTP_HOST" => HTTP_HOST,
                'method' => $method,
                'login' => $login,
                'email' => $email,
                'password' => $password,
                'confirm_password' => $confirm_password
            ]
        ));
        return $response;
    }

    /**
     * Vérifie, charge et affiche connection.twig
     *
     * @param Request $request
     * @param Response $response
     * @param $args
     * @return Response
     */
    public function connection(Request $request, Response $response, $args)
    {
        $method = $request -> getMethod();
        if ($method == 'POST')
        {
            $params = (array)$request -> getParsedBody();

            $login = $params['logLogin'];
            $password = $params['logPassword'];

            $connectionController = new ConnectionController();
            $connectionController -> connect($login, $password);
        } else {
            $login = '';
            $password = '';
        }

        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render(
            'connection.twig',
            [
                'BASE_PATH' => BASE_PATH,
                "HTTP_HOST" => HTTP_HOST,
                'method' => $method,
                'login' => $login,
                'password' => $password
            ]
        ));

        return $response;
    }

    /**
     * Permet de déconnecter l'utilisateur lorsque que celui-ci intéragis avec le bouton déconnection
     *
     * @param Request $request
     * @param Response $response
     * @param $args
     * @return Response
     */
    public function logOut(Request $request, Response $response, $args)
    {
        session_destroy();
        return $response
            -> withHeader('Location', 'https://' . HTTP_HOST . BASE_PATH)
            -> withStatus(302);
    }

    public function profil(Request $request, Response $response, $args)
    {
        $method = $request -> getMethod();
        if ($method == 'POST')
        {
            $params = (array)$request -> getParsedBody();

            $login = $params['profilLogin'];
            $email = $params['profilEmail'];
            $password = $params['profilPassword'];
            $confirm_password = $params['confirmProfilPassword'];

            $controllerProfil = new ProfilController();
            $controllerProfil -> modifyProfil($login, $email, $password, $confirm_password);
        } else {
            $login = '';
            $email = '';
            $password = '';
            $confirm_password = '';
        }

        $this -> preloadTwig();
        $response -> getBody() -> write($this -> twig -> render(
            'profil.twig',
            [
                'BASE_PATH' => BASE_PATH,
                'HTTP_HOST' => HTTP_HOST,
                'method' => $method,
                'login' => $login,
                'password' => $password,
                'email' => $email
            ]
        ));

        return $response;
    }
}