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
        $interMonths = array_reverse($interRepo->countByMonth(), true);

        return $this->render('statistiques/index.html.twig', [
            // RQTH
            'rqth_by_etat'    => $rqthRepo->countByEtat(),
            'rqth_by_service' => $rqthRepo->countByService(),
            'rqth_expiring'   => $rqthRepo->findExpiringWithin(3),

            // FIPHFP
            'fiphfp_by_etat'  => $fiphfpRepo->countByEtat(),
            'fiphfp_montants' => $fiphfpRepo->sumMontants(),
            'fiphfp_by_reste' => $fiphfpRepo->countByTypeReste(),
            'fiphfp_objets'   => $fiphfpRepo->topObjets(),

            // Interventions
            'inter_by_urgence' => $interRepo->countByUrgence(),
            'inter_by_service' => $interRepo->countByService(),
            'inter_by_month'   => $interMonths,
            'inter_top_agents' => $interRepo->topAgents(),
        ]);
    }
}
