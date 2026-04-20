<?php

namespace App\Controller;

use App\Entity\Intervenant;
use App\Form\IntervenantType;
use App\Repository\IntervenantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/intervenant')]
#[IsGranted('ROLE_ADMIN')]
class IntervenantController extends AbstractController
{
    #[Route('/', name: 'app_intervenant_index')]
    public function index(IntervenantRepository $repository): Response
    {
        return $this->render('intervenant/index.html.twig', [
            'intervenants' => $repository->findBy([], ['nom' => 'ASC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_intervenant_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $intervenant = new Intervenant();
        $form = $this->createForm(IntervenantType::class, $intervenant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($intervenant);
            $em->flush();
            $this->addFlash('success', 'Intervenant ajouté.');
            return $this->redirectToRoute('app_intervenant_index');
        }

        return $this->render('intervenant/form.html.twig', ['form' => $form, 'title' => 'Nouvel intervenant']);
    }

    #[Route('/{id}/modifier', name: 'app_intervenant_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Intervenant $intervenant, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(IntervenantType::class, $intervenant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Intervenant modifié.');
            return $this->redirectToRoute('app_intervenant_index');
        }

        return $this->render('intervenant/form.html.twig', ['form' => $form, 'title' => 'Modifier l\'intervenant']);
    }

    #[Route('/{id}/supprimer', name: 'app_intervenant_delete', methods: ['POST'])]
    public function delete(Request $request, Intervenant $intervenant, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$intervenant->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($intervenant);
            $em->flush();
            $this->addFlash('success', 'Intervenant supprimé.');
        }
        return $this->redirectToRoute('app_intervenant_index');
    }
}
