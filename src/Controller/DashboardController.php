<?php

namespace App\Controller;

use App\Repository\DocumentRepository;
use App\Repository\FiphfpRepository;
use App\Repository\InterRepository;
use App\Repository\RqthRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DashboardController extends AbstractController
{
    #[Route('/', name: 'app_dashboard')]
    public function index(
        RqthRepository $rqthRepo,
        FiphfpRepository $fiphfpRepo,
        InterRepository $interRepo,
        DocumentRepository $docRepo,
    ): Response {
        return $this->render('dashboard/index.html.twig', [
            'nb_rqth'    => $rqthRepo->count([]),
            'nb_fiphfp'  => $fiphfpRepo->count([]),
            'nb_inter'   => $interRepo->count([]),
            'documents'  => $docRepo->findBy([], ['dateAjout' => 'DESC']),
        ]);
    }
}
