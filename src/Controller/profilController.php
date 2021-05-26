<?php

namespace App\Controller;

use App\Model\profilModel;

class profilController extends Controller
{
    public function testProfil()
    {
        $test = new profilModel();
        $test -> getProfil();
    }
}