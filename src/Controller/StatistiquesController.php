<?php

namespace App\Controller;

use App\Repository\InterRepository;
use App\Repository\RqthRepository;
use App\Repository\FiphfpRepository;
use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/statistiques')]
class StatistiquesController extends AbstractController
{
    #[Route('/pdf', name: 'app_statistiques_pdf')]
    public function pdf(InterRepository $interRepo, RqthRepository $rqthRepo, FiphfpRepository $fiphfpRepo): Response
    {
        $data = $this->buildData($interRepo, $rqthRepo, $fiphfpRepo);
        $html = $this->renderView('statistiques/pdf.html.twig', $data);

        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isRemoteEnabled', false);

        $dompdf = new Dompdf($options);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();

        return new Response(
            $dompdf->output(),
            200,
            ['Content-Type' => 'application/pdf', 'Content-Disposition' => 'inline; filename="statistiques.pdf"']
        );
    }

    #[Route('/', name: 'app_statistiques')]
    public function index(InterRepository $interRepo, RqthRepository $rqthRepo, FiphfpRepository $fiphfpRepo): Response
    {
        return $this->render('statistiques/index.html.twig', $this->buildData($interRepo, $rqthRepo, $fiphfpRepo));
    }

    private function buildData(InterRepository $interRepo, RqthRepository $rqthRepo, FiphfpRepository $fiphfpRepo): array
    {
        return [
            'rqth_by_etat'     => $rqthRepo->countByEtat(),
            'rqth_by_service'  => $rqthRepo->countByService(),
            'rqth_expiring'    => $rqthRepo->findExpiringWithin(3),
            'fiphfp_by_etat'   => $fiphfpRepo->countByEtat(),
            'fiphfp_montants'  => $fiphfpRepo->sumMontants(),
            'fiphfp_by_reste'  => $fiphfpRepo->countByTypeReste(),
            'fiphfp_objets'    => $fiphfpRepo->topObjets(),
            'inter_by_urgence' => $interRepo->countByUrgence(),
            'inter_by_service' => $interRepo->countByService(),
            'inter_by_month'   => array_reverse($interRepo->countByMonth(), true),
            'inter_top_agents' => $interRepo->topAgents(),
        ];
    }
}
