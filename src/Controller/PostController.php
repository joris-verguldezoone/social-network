<?php

namespace App\Controller;

use App\Model\PostModel;

class PostController extends Controller
{
    // function qui gerent le formulaire en rapport avec les posts

    public function managePost($id_google, $contenu)
    {
        if ((!empty($contenu))) {
            $postModel = new PostModel();

            $secureContent = $this->secure($contenu);
            $errorLog = null;

            $contentCount = strlen($secureContent);

            if (($contentCount >= 1)) {
                if (($contentCount <= 500)) {
                    $date = date('d.m.y');
                    $postModel->newPost($id_google, $secureContent, $date);
                    echo ("<p>Votre publication viens d'être publié avec succès !</p>");
                } else {
                    $errorLog = '<p>Votre publication ne dois pas dépasser plus de 500 caractères.</p>';
                }
            } else {
                $errorLog = '<p>Votre publication dois faire au moins 1 caractère.</p>';
            }
        } else {
            $errorLog = '<p>Veuillez remplir le formulaire.</p>';
        }

        echo $errorLog;
    }

    public function allPosts()
    {
        $posts = new PostModel();
        $result = $posts->getAllPosts();
        $str = "";
        foreach ($result as $value) {
            $str = $str . "<div class='unique_post'>
                        <div class='top_post'><img class='image_post' src='" . $value['image'] . "' alt='Image utilisateur'><p class='pseudo_user'>" . $value['login'] . "</p></div>
                        <div class='mid_post'><p class='content'>" . $value['contenu'] . "</p></div>
                        <div class='bot_post'><p class='bottom_content'>" . strval($value['nb_like']) . "like</p> 
                        <p class='bottom_content'>" . strval($value['nb_comment']) . "</p>
                        <p class='bottom_content'>" . strval($value['date']) . "</p></div>
                        </div>";
        }

        echo $str;
    }

    public function allPostsInProfil($id_google): array
    {
        $posts = new PostModel();
        return $posts->selectAllPosts($id_google);
    }
}
