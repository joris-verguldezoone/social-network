<?php

namespace App\Controller;

use App\Model\PostModel;

class PostController extends Controller
{
    // function qui gerent le formulaire en rapport avec les posts

    public function managePost($id_google, $contenu)
    {
        if ((!empty($contenu)))
        {
            $postModel = new PostModel();

            $secureContent = $this -> secure($contenu);
            $errorLog = null;

            $contentCount = strlen($secureContent);

            if (($contentCount >= 1))
            {
                if (($contentCount <= 500))
                {
                    $date = date('d.m.y');
                    $postModel -> newPost($id_google, $secureContent, $date);
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
}