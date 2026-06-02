<?php

namespace App\Controller;

use App\Repository\InterRepository;
use App\Repository\RqthRepository;
use App\Repository\FiphfpRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/statistiques')]
class StatistiquesController extends AbstractController
{
    #[Route('/', name: 'app_statistiques')]
    public function index(InterRepository $interRepo, RqthRepository $rqthRepo, FiphfpRepository $fiphfpRepo): Response
    {
        return $this->render('statistiques/index.html.twig', [
            'nb_inter'  => $interRepo->count([]),
            'nb_rqth'   => $rqthRepo->count([]),
            'nb_fiphfp' => $fiphfpRepo->count([]),
        ]);
    }
}
