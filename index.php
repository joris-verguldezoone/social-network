<?php

use Slim\Factory\AppFactory;
use App\Controller\ManageController;

require __DIR__ . '/vendor/autoload.php';

session_start();

spl_autoload_register(function ($className)
{
    $className = str_replace('App', 'src', $className);
    $filePath =  str_replace('\\', '/', $className) . '.php';
    if (file_exists($filePath)) { require($filePath); }
});

$app = AppFactory::create();

define('BASE_PATH', rtrim(dirname($_SERVER["SCRIPT_NAME"]), '/'));
define('HTTP_HOST', $_SERVER["HTTP_HOST"]);
$app->setBasePath(BASE_PATH);

$app -> addRoutingMiddleware();

$errorMiddleware = $app -> addErrorMiddleware(true, true, true);

$app -> get('/', ManageController::class . ':main');

$app -> map(['GET', 'POST'], '/profil', ManageController::class . ':profil');

$app -> get('/chat', ManageController::class . ':chat');

$app -> run(); 