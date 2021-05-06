<?php

namespace App\Controller;

use Twig\Environment;
use Twig\Loader\FilesystemLoader;

class Controller
{
    protected $twig;

    /**
     * Charge les fichiers .twig
     */
    public function preloadTwig()
    {
        $loader = new FilesystemLoader('View');
        $this -> twig = new Environment($loader);

        $this -> twig -> addGlobal('session', $_SESSION);
        $this -> twig -> addGlobal('BASE_PATH', BASE_PATH);
        $this -> twig -> addGlobal('HTTP_HOST', HTTP_HOST);
    }

    /**
     * Permet de sécuriser les variables passer en paramètre
     *
     * @param $var
     * @return string
     */
    public function secure($var): string
    {
        return $var = htmlspecialchars(trim($var));
    }

    /**
     * Permet de rediriger l'utilisateur dans un chemin donné en paramètre
     *
     * @param string $path
     */
    public function redirect(string $path)
    {
        header('location: ' . $path);
        exit();
    }
}