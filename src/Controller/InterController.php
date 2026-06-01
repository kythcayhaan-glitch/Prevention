<?php

namespace App\Controller;

use App\Entity\Inter;
use App\Form\InterType;
use App\Repository\InterRepository;
use App\Repository\AgentRepository;
use App\Repository\ServiceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/intervention')]
class InterController extends AbstractController
{
    #[Route('/', name: 'app_inter_index')]
    public function index(InterRepository $repository): Response
    {
        return $this->render('inter/index.html.twig', [
            'inters' => $repository->findBy([], ['id' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_inter_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em, AgentRepository $agentRepo, ServiceRepository $serviceRepo): Response
    {
        $inter = new Inter();
        $agents = $this->buildAgentsList($agentRepo);
        $services = $this->buildServicesList($serviceRepo);
        $form = $this->createForm(InterType::class, $inter, ['agents' => $agents, 'services' => $services]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $inter->setUserInter($this->getUser()->getUserIdentifier());
            $em->persist($inter);
            $em->flush();
            $this->addFlash('success', 'Intervention ajoutée avec succès.');
            return $this->redirectToRoute('app_inter_index');
        }

        return $this->render('inter/form.html.twig', [
            'form' => $form,
            'title' => 'Nouvelle intervention',
        ]);
    }

    #[Route('/{id}', name: 'app_inter_show')]
    public function show(Inter $inter): Response
    {
        return $this->render('inter/show.html.twig', ['inter' => $inter]);
    }

    #[Route('/{id}/modifier', name: 'app_inter_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Inter $inter, EntityManagerInterface $em, AgentRepository $agentRepo, ServiceRepository $serviceRepo): Response
    {
        $agents = $this->buildAgentsList($agentRepo);
        $services = $this->buildServicesList($serviceRepo);
        $form = $this->createForm(InterType::class, $inter, ['agents' => $agents, 'services' => $services]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Intervention modifiée avec succès.');
            return $this->redirectToRoute('app_inter_show', ['id' => $inter->getId()]);
        }

        return $this->render('inter/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier l\'intervention',
            'inter' => $inter,
        ]);
    }

    private function buildServicesList(ServiceRepository $serviceRepo): array
    {
        $services = [];
        foreach ($serviceRepo->findBy([], ['service' => 'ASC']) as $s) {
            $services[] = $s->getService();
        }
        return $services;
    }

    private function buildAgentsList(AgentRepository $agentRepo): array
    {
        $agents = [];
        foreach ($agentRepo->findBy([], ['nom' => 'ASC']) as $agent) {
            $nom = $agent->getNomComplet();
            if ($nom !== '') {
                $agents[] = $nom;
            }
        }
        return $agents;
    }

    #[Route('/{id}/supprimer', name: 'app_inter_delete', methods: ['POST'])]
    public function delete(Request $request, Inter $inter, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$inter->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($inter);
            $em->flush();
            $this->addFlash('success', 'Intervention supprimée.');
        }
        return $this->redirectToRoute('app_inter_index');
    }
}
