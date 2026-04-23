<?php

namespace App\Controller;

use App\Entity\Actualite;
use App\Repository\ActualiteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/actualites')]
class ActualiteController extends AbstractController
{
    private function checkMarliere(): void
    {
        if (!$this->getUser() || $this->getUser()->getUserIdentifier() !== 'marliere') {
            throw $this->createAccessDeniedException();
        }
    }

    #[Route('/', name: 'app_actualite_index')]
    public function index(ActualiteRepository $repo): Response
    {
        $this->checkMarliere();

        return $this->render('actualite/index.html.twig', [
            'actualites' => $repo->findBy([], ['dateCreation' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_actualite_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $this->checkMarliere();

        if ($request->isMethod('POST')) {
            $actu = new Actualite();
            $actu->setTitre(trim($request->request->get('titre', '')) ?: null);
            $actu->setContenu(trim($request->request->get('contenu', '')));

            if ($actu->getContenu()) {
                $em->persist($actu);
                $em->flush();
                $this->addFlash('success', 'Mise à jour ajoutée.');
            }
            return $this->redirectToRoute('app_actualite_index');
        }

        return $this->render('actualite/form.html.twig', ['actu' => null]);
    }

    #[Route('/{id}/modifier', name: 'app_actualite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Actualite $actu, EntityManagerInterface $em): Response
    {
        $this->checkMarliere();

        if ($request->isMethod('POST')) {
            $actu->setTitre(trim($request->request->get('titre', '')) ?: null);
            $actu->setContenu(trim($request->request->get('contenu', '')));
            $em->flush();
            $this->addFlash('success', 'Mise à jour modifiée.');
            return $this->redirectToRoute('app_actualite_index');
        }

        return $this->render('actualite/form.html.twig', ['actu' => $actu]);
    }

    #[Route('/{id}/supprimer', name: 'app_actualite_delete', methods: ['POST'])]
    public function delete(Request $request, Actualite $actu, EntityManagerInterface $em): Response
    {
        $this->checkMarliere();

        if ($this->isCsrfTokenValid('delete-actu-' . $actu->getId(), $request->request->get('_token'))) {
            $em->remove($actu);
            $em->flush();
            $this->addFlash('success', 'Mise à jour supprimée.');
        }
        return $this->redirectToRoute('app_actualite_index');
    }
}
