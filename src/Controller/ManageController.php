<?php

namespace App\Controller;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Controller\ModifyProfilController;
use Slim\App;

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
        $this->preloadTwig();
        $response->getBody()->write($this->twig->render('home.twig'));
        return $response;
    }

    public function showProfil(Request $request, Response $response, $args)
    {
        $this->preloadTwig();
        $response->getBody()->write($this->twig->render('profil.twig'));
        return $response;
    }

    public function modifyProfil(Request $request, Response $response, $args)
    {
        $profilPicture = new ModifyProfilController();
        $profilPicture->newProfilPicture();

        $this->preloadTwig();
        $response->getBody()->write($this->twig->render('modifyProfil.twig'));
        return $response;
    }

    public function chat(Request $request, Response $response, $args)
    {
        $this->preloadTwig();
        $response->getBody()->write($this->twig->render('chat.twig'));
        return $response;
    }
    public function log_out(Request $request, Response $response, $args)
    {
        $model = new \App\Model\ConnectionModel;

        $id = $_SESSION['user']['sub'];

        $model->updateOneValue('user_log', 'connection', 'id_google', 0, $id);

        session_destroy();
        return $response;
    }
    public function who_am_i(Request $request, Response $response, $args)
    {
        if (isset($_SESSION['user'])){
            $iAm = $_SESSION['user'];
            $iAm = json_encode($iAm);
            $response->getBody()->write($iAm);
            return $response;
        }
        else
        {
            $iAm = "nobody";
            $iAm = json_encode($iAm);
            $response->getBody()->write($iAm);
            return $response;
        }

    }
    public function changeBackgroundProfil(Request $request, Response $response, $args)
    {
        $backgroundPicture = new ModifyProfilController();
        $backgroundPicture->newBackgroundPicture();

        $this->preloadTwig();
        $response->getBody();
        return $response;
    }
}
