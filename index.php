<?php
require __DIR__ . '/vendor/autoload.php';

use Slim\Factory\AppFactory;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Controller\ManageController;
use App\Controller\GoogleController;
use App\Controller\Controller;
use Google\Client;

session_start();

spl_autoload_register(function ($className) {
    $className = str_replace('App', 'src', $className);
    $filePath =  str_replace('\\', '/', $className) . '.php';
    if (file_exists($filePath)) {
        require($filePath);
    }
});

$app = AppFactory::create();

define('BASE_PATH', rtrim(dirname($_SERVER["SCRIPT_NAME"]), '/'));
define('HTTP_HOST', $_SERVER["HTTP_HOST"]);
$app->setBasePath(BASE_PATH);

$app->addRoutingMiddleware();

$errorMiddleware = $app->addErrorMiddleware(true, true, true);

$app->get('/', ManageController::class . ':home');
$app->get('/accueil', ManageController::class . ':home');
$app->get('/home', ManageController::class . ':home');

$app->map(['GET', 'POST'], '/modifyProfil', ManageController::class . ':modifyProfil');

$app->map(['GET', 'POST'], '/profil', ManageController::class . ':showProfil');

$app->get('/chat', ManageController::class . ':chat');
$app->get('/message', ManageController::class . ':chat');
$app->get('/discussion', ManageController::class . ':chat');

$app->get('/connection', GoogleController::class . ':dumb');

$app->post('/authentification', GoogleController::class . ':donkey');

$app->post('/isConnected', GoogleController::class . ':isConnected');

$app->post('/log_out', ManageController::class . ':log_out');

$app->run();
