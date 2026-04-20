<?php

namespace App\Controller;

use App\Entity\Batiment;
use App\Form\BatimentType;
use App\Repository\BatimentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/batiment')]
#[IsGranted('ROLE_ADMIN')]
class BatimentController extends AbstractController
{
    #[Route('/', name: 'app_batiment_index')]
    public function index(BatimentRepository $repository): Response
    {
        return $this->render('batiment/index.html.twig', [
            'batiments' => $repository->findBy([], ['designation' => 'ASC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_batiment_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $batiment = new Batiment();
        $form = $this->createForm(BatimentType::class, $batiment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($batiment);
            $em->flush();
            $this->addFlash('success', 'Bâtiment ajouté.');
            return $this->redirectToRoute('app_batiment_index');
        }

        return $this->render('batiment/form.html.twig', ['form' => $form, 'title' => 'Nouveau bâtiment']);
    }

    #[Route('/{id}/modifier', name: 'app_batiment_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Batiment $batiment, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(BatimentType::class, $batiment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Bâtiment modifié.');
            return $this->redirectToRoute('app_batiment_index');
        }

        return $this->render('batiment/form.html.twig', ['form' => $form, 'title' => 'Modifier le bâtiment']);
    }

    #[Route('/{id}/supprimer', name: 'app_batiment_delete', methods: ['POST'])]
    public function delete(Request $request, Batiment $batiment, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$batiment->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($batiment);
            $em->flush();
            $this->addFlash('success', 'Bâtiment supprimé.');
        }
        return $this->redirectToRoute('app_batiment_index');
    }
}
