<?php

namespace App\Controller;

use App\Entity\Fiphfp;
use App\Form\FiphfpType;
use App\Repository\FiphfpRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/fiphfp')]
class FiphfpController extends AbstractController
{
    #[Route('/', name: 'app_fiphfp_index')]
    public function index(FiphfpRepository $repository): Response
    {
        return $this->render('fiphfp/index.html.twig', [
            'fiphfps' => $repository->findBy([], ['id' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_fiphfp_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $fiphfp = new Fiphfp();
        $form = $this->createForm(FiphfpType::class, $fiphfp);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($fiphfp);
            $em->flush();
            $this->addFlash('success', 'Demande FIPHFP ajoutée avec succès.');
            return $this->redirectToRoute('app_fiphfp_index');
        }

        return $this->render('fiphfp/form.html.twig', [
            'form' => $form,
            'title' => 'Nouvelle demande FIPHFP',
        ]);
    }

    #[Route('/{id}', name: 'app_fiphfp_show')]
    public function show(Fiphfp $fiphfp): Response
    {
        return $this->render('fiphfp/show.html.twig', ['fiphfp' => $fiphfp]);
    }

    #[Route('/{id}/modifier', name: 'app_fiphfp_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Fiphfp $fiphfp, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(FiphfpType::class, $fiphfp);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Demande FIPHFP modifiée avec succès.');
            return $this->redirectToRoute('app_fiphfp_show', ['id' => $fiphfp->getId()]);
        }

        return $this->render('fiphfp/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier la demande FIPHFP',
            'fiphfp' => $fiphfp,
        ]);
    }

    #[Route('/{id}/supprimer', name: 'app_fiphfp_delete', methods: ['POST'])]
    public function delete(Request $request, Fiphfp $fiphfp, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$fiphfp->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($fiphfp);
            $em->flush();
            $this->addFlash('success', 'Demande FIPHFP supprimée.');
        }
        return $this->redirectToRoute('app_fiphfp_index');
    }
}
