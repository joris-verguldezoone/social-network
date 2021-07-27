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
    public function home(Request $request, Response $response, $args): Response
    {
        $postController = new PostController();
        $allPosts = $postController -> allPosts();

        $method = $request -> getMethod();
        if ($method == 'POST')
        {
            $params = (array)$request -> getParsedBody();
            $contenu = $params['publish'];
            $id_google = $_SESSION['user']['sub'];

            if (isset($_POST['submitPublish']))
            {
                $newPost = new PostController();
                $newPost -> managePost($id_google, $contenu);
            }
        } else {
            $contenu = '';
        }

        $this->preloadTwig();
        $response->getBody()->write($this->twig->render(
            'home.twig',
            [
                'HTTP_HOST' => HTTP_HOST, 'BASE_PATH' => BASE_PATH, 'method' => $method,
                'contenu' => $contenu, 'allPosts' => $allPosts
            ]
        ));
        return $response;
    }

    public function showProfil(Request $request, Response $response, $args)
    {
        $postsProfil = new PostController();
        $id_google = $_SESSION['user']['sub'];
        $allPostUser = $postsProfil -> allPostsInProfil($id_google);

        $this->preloadTwig();
        $response->getBody()->write($this->twig->render(
            'profil.twig',
            [
                'HTTP_HOST' => HTTP_HOST, 'BASE_PATH' => BASE_PATH, 'allPostUser' => $allPostUser
            ]
        ));
        return $response;
    }

    public function modifyProfil(Request $request, Response $response, $args)
    {
        // Appel de la class Controller qui permet de modifier/supprimer ses posts
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
        $iAm = $_SESSION['user']['sub'];
        $iAm = json_encode($iAm);
        $response->getBody()->write($iAm);
        return $response;
    }
    public function changeBackgroundProfil(Request $request, Response $response, $args)
    {
        $backgroundPicture = new ModifyProfilController();
        $value = $backgroundPicture->newBackgroundPicture();

        $value = json_encode($value);
        $this->preloadTwig();
        $response->getBody()->write($value);
        return $response;
    }
}
