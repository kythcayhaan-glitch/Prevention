<?php

namespace App\Controller;

use App\Entity\Inter;
use App\Entity\InterAction;
use App\Repository\InterActionRepository;
use App\Form\InterType;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Repository\InterRepository;
use App\Repository\AgentRepository;
use App\Repository\ServiceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

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

    #[IsGranted('ROLE_ADMIN')]
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

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/modifier', name: 'app_inter_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Inter $inter, EntityManagerInterface $em, AgentRepository $agentRepo, ServiceRepository $serviceRepo): Response
    {
        if (!$inter->getAgentVisite() && $inter->getUserInter()) {
            $inter->setAgentVisite($inter->getUserInter());
        }
        $agents = $this->buildAgentsList($agentRepo);
        $services = $this->buildServicesList($serviceRepo);
        $form = $this->createForm(InterType::class, $inter, ['agents' => $agents, 'services' => $services]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Intervention modifiée avec succès.');
            return $this->redirectToRoute('app_inter_edit', ['id' => $inter->getId()]);
        }

        return $this->render('inter/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier l\'intervention',
            'inter' => $inter,
            'action_add_url' => $this->generateUrl('app_inter_action_add', ['id' => $inter->getId()]),
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

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/action/ajouter', name: 'app_inter_action_add', methods: ['POST'])]
    public function addAction(Request $request, Inter $inter, EntityManagerInterface $em): JsonResponse
    {
        $description = trim($request->request->get('description', ''));
        $date = trim($request->request->get('date', ''));

        if (!$description) {
            return $this->json(['error' => 'Description vide'], 400);
        }

        $action = new InterAction();
        $action->setInter($inter);
        $action->setDescription($description);
        $action->setDate($date ?: null);
        $em->persist($action);
        $em->flush();

        return $this->json([
            'id' => $action->getId(),
            'date' => $action->getDate(),
            'description' => $action->getDescription(),
            'deleteUrl' => $this->generateUrl('app_inter_action_delete', ['actionId' => $action->getId()]),
        ]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/action/{actionId}/supprimer', name: 'app_inter_action_delete', methods: ['POST'])]
    public function deleteAction(int $actionId, InterActionRepository $repo, EntityManagerInterface $em): JsonResponse
    {
        $action = $repo->find($actionId);
        if ($action) {
            $em->remove($action);
            $em->flush();
        }
        return $this->json(['ok' => true]);
    }

    #[IsGranted('ROLE_ADMIN')]
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
