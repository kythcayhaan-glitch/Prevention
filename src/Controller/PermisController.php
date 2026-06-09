<?php

namespace App\Controller;

use App\Entity\Permis;
use App\Form\PermisType;
use App\Repository\PermisRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/permis')]
class PermisController extends AbstractController
{
    #[Route('/', name: 'app_permis_index')]
    public function index(PermisRepository $repository): Response
    {
        return $this->render('permis/index.html.twig', [
            'permis' => $repository->findBy([], ['nom' => 'ASC']),
        ]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/nouveau', name: 'app_permis_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $permis = new Permis();
        $form = $this->createForm(PermisType::class, $permis);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($permis);
            $em->flush();
            $this->addFlash('success', 'Agent ajouté avec succès.');
            return $this->redirectToRoute('app_permis_index');
        }

        return $this->render('permis/form.html.twig', [
            'form' => $form,
            'title' => 'Nouveau permis',
            'permis' => null,
        ]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/modifier', name: 'app_permis_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Permis $permis, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(PermisType::class, $permis);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Permis mis à jour.');
            return $this->redirectToRoute('app_permis_index');
        }

        return $this->render('permis/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier — ' . $permis->getNomComplet(),
            'permis' => $permis,
        ]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/supprimer', name: 'app_permis_delete', methods: ['POST'])]
    public function delete(Request $request, Permis $permis, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete' . $permis->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($permis);
            $em->flush();
            $this->addFlash('success', 'Supprimé.');
        }
        return $this->redirectToRoute('app_permis_index');
    }
}
