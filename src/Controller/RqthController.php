<?php

namespace App\Controller;

use App\Entity\Rqth;
use App\Form\RqthType;
use App\Repository\RqthRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/rqth')]
class RqthController extends AbstractController
{
    #[Route('/', name: 'app_rqth_index')]
    public function index(RqthRepository $repository): Response
    {
        return $this->render('rqth/index.html.twig', [
            'rqths' => $repository->findBy([], ['id' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_rqth_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $rqth = new Rqth();
        $form = $this->createForm(RqthType::class, $rqth);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($rqth);
            $em->flush();
            $this->addFlash('success', 'RQTH ajouté avec succès.');
            return $this->redirectToRoute('app_rqth_index');
        }

        return $this->render('rqth/form.html.twig', [
            'form' => $form,
            'title' => 'Nouveau RQTH',
        ]);
    }

    #[Route('/{id}', name: 'app_rqth_show')]
    public function show(Rqth $rqth): Response
    {
        return $this->render('rqth/show.html.twig', ['rqth' => $rqth]);
    }

    #[Route('/{id}/modifier', name: 'app_rqth_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Rqth $rqth, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(RqthType::class, $rqth);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'RQTH modifié avec succès.');
            return $this->redirectToRoute('app_rqth_show', ['id' => $rqth->getId()]);
        }

        return $this->render('rqth/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier le RQTH',
            'rqth' => $rqth,
        ]);
    }

    #[Route('/{id}/supprimer', name: 'app_rqth_delete', methods: ['POST'])]
    public function delete(Request $request, Rqth $rqth, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$rqth->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($rqth);
            $em->flush();
            $this->addFlash('success', 'RQTH supprimé.');
        }
        return $this->redirectToRoute('app_rqth_index');
    }
}
