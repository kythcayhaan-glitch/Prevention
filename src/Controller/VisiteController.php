<?php

namespace App\Controller;

use App\Entity\Visite;
use App\Form\VisiteType;
use App\Repository\VisiteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/visite')]
class VisiteController extends AbstractController
{
    #[Route('/', name: 'app_visite_index')]
    public function index(VisiteRepository $repository): Response
    {
        return $this->render('visite/index.html.twig', [
            'visites' => $repository->findBy([], ['id' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_visite_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $visite = new Visite();
        $form = $this->createForm(VisiteType::class, $visite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $visite->setUserVisite($this->getUser()->getUserIdentifier());
            $em->persist($visite);
            $em->flush();
            $this->addFlash('success', 'Visite ajoutée avec succès.');
            return $this->redirectToRoute('app_visite_index');
        }

        return $this->render('visite/form.html.twig', [
            'form' => $form,
            'title' => 'Nouvelle visite de prévention',
        ]);
    }

    #[Route('/{id}', name: 'app_visite_show')]
    public function show(Visite $visite): Response
    {
        return $this->render('visite/show.html.twig', ['visite' => $visite]);
    }

    #[Route('/{id}/modifier', name: 'app_visite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(VisiteType::class, $visite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Visite modifiée avec succès.');
            return $this->redirectToRoute('app_visite_show', ['id' => $visite->getId()]);
        }

        return $this->render('visite/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier la visite',
            'visite' => $visite,
        ]);
    }

    #[Route('/{id}/supprimer', name: 'app_visite_delete', methods: ['POST'])]
    public function delete(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$visite->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($visite);
            $em->flush();
            $this->addFlash('success', 'Visite supprimée.');
        }
        return $this->redirectToRoute('app_visite_index');
    }
}
