<?php

namespace App\Controller;

use App\Repository\VisiteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/statistiques')]
class StatistiquesController extends AbstractController
{
    #[Route('/visites', name: 'app_stats_visites')]
    public function visites(Request $request, VisiteRepository $repo): Response
    {
        $annees = $repo->getAnneesDisponibles();
        $anneeSelectionnee = $request->query->get('annee', $annees[0] ?? null);

        $statsByAgent = $repo->getStatsByAnnee($anneeSelectionnee);
        $totalByAnnee = $repo->getTotalByAnnee($anneeSelectionnee);

        // Grouper par agent pour l'affichage
        $parAgent = [];
        foreach ($statsByAgent as $row) {
            $agent = $row['agent'] ?: 'Non renseigné';
            if (!isset($parAgent[$agent])) {
                $parAgent[$agent] = ['agent' => $agent, 'pole_service' => $row['pole_service'], 'nb_visites' => 0];
            }
            $parAgent[$agent]['nb_visites'] += (int)$row['nb_visites'];
        }
        usort($parAgent, fn($a, $b) => $b['nb_visites'] - $a['nb_visites']);

        return $this->render('statistiques/visites.html.twig', [
            'annees' => $annees,
            'annee_selectionnee' => $anneeSelectionnee,
            'par_agent' => $parAgent,
            'total_by_annee' => $totalByAnnee,
            'total_annee' => array_sum(array_column($totalByAnnee, 'nb_visites')),
        ]);
    }
}
