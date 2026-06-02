<?php

namespace App\Controller;

use App\Entity\Agent;
use App\Repository\AgentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/agent')]
class AgentController extends AbstractController
{
    #[Route('/creer', name: 'app_agent_create', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em, AgentRepository $repo): JsonResponse
    {
        $nom = strtoupper(trim($request->request->get('nom', '')));
        $prenom = trim($request->request->get('prenom', ''));

        if (!$nom) {
            return $this->json(['error' => 'Nom requis'], 400);
        }

        $agent = new Agent();
        $agent->setNom($nom);
        $agent->setPrenom($prenom ?: null);
        $em->persist($agent);
        $em->flush();

        return $this->json(['value' => $agent->getNomComplet(), 'label' => $agent->getNomComplet()]);
    }
}
