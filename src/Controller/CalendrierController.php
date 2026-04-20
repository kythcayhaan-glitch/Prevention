<?php

namespace App\Controller;

use App\Repository\VisiteDateRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/calendrier')]
class CalendrierController extends AbstractController
{
    #[Route('/visites', name: 'app_calendrier_visites')]
    public function visites(): Response
    {
        return $this->render('calendrier/visites.html.twig');
    }

    #[Route('/visites/events', name: 'app_calendrier_visites_events')]
    public function events(VisiteDateRepository $repo): JsonResponse
    {
        $dates = $repo->findAllWithVisite();

        $events = [];
        foreach ($dates as $vd) {
            $date = $vd->getDate();
            if (!$date) {
                continue;
            }
            $parts = explode('/', $date);
            if (count($parts) !== 3) {
                continue;
            }
            $iso = sprintf('%s-%s-%s', $parts[2], $parts[1], $parts[0]);
            $visite = $vd->getVisite();
            $type = $vd->getType();

            $events[] = [
                'id' => $vd->getId(),
                'title' => $visite?->getAgentVisite() ?: 'Agent inconnu',
                'start' => $iso,
                'color' => $type === 'prochaine' ? '#198754' : '#0d6efd',
                'extendedProps' => [
                    'agent' => $visite?->getAgentVisite(),
                    'pole' => $visite?->getPoleServiceVisite(),
                    'type' => $type === 'prochaine' ? 'Prévue' : 'Réalisée',
                ],
            ];
        }

        return new JsonResponse($events);
    }
}
