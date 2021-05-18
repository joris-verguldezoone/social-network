<?php

use Slim\Factory\AppFactory;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Controller\ManageController;

require __DIR__ . '/vendor/autoload.php';

session_start();

spl_autoload_register(function ($className) {
    $className = str_replace('App', 'src', $className);
    $filePath =  str_replace('\\', '/', $className) . '.php'; // Peut etre remplacer le .php en .twig ???
    if (file_exists($filePath)) { require($filePath); }
});
$app = AppFactory::create();


define('BASE_PATH', rtrim(dirname($_SERVER["SCRIPT_NAME"]), '/'));
define('HTTP_HOST', $_SERVER["HTTP_HOST"]);
$app->setBasePath(BASE_PATH);
echo __DIR__;
var_dump(BASE_PATH);
var_dump($_SERVER["SCRIPT_NAME"]);
var_dump($_SERVER["HTTP_HOST"]);

$app -> addRoutingMiddleware();

$errorMiddleware = $app -> addErrorMiddleware(true, true, true);

$app -> get('/', ManageController::class . ':main');

$app -> map(['GET', 'POST'],'/inscription', ManageController::class . ':inscription');

$app -> map(['GET', 'POST'], '/connection', ManageController::class . ':connection');

$app -> run();