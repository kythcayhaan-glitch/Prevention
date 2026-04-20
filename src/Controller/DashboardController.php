<?php

namespace App\Controller;

use App\Repository\FiphfpRepository;
use App\Repository\InterRepository;
use App\Repository\RqthRepository;
use App\Repository\VisiteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DashboardController extends AbstractController
{
    #[Route('/', name: 'app_dashboard')]
    public function index(
        VisiteRepository $visiteRepo,
        RqthRepository $rqthRepo,
        FiphfpRepository $fiphfpRepo,
        InterRepository $interRepo,
    ): Response {
        return $this->render('dashboard/index.html.twig', [
            'nb_visites' => $visiteRepo->count([]),
            'nb_rqth' => $rqthRepo->count([]),
            'nb_fiphfp' => $fiphfpRepo->count([]),
            'nb_inter' => $interRepo->count([]),
        ]);
    }
}
