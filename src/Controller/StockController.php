<?php

namespace App\Controller;

use App\Entity\Stock;
use App\Form\StockType;
use App\Repository\StockRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/stock')]
#[IsGranted('ROLE_ADMIN')]
class StockController extends AbstractController
{
    #[Route('/', name: 'app_stock_index')]
    public function index(StockRepository $repository): Response
    {
        return $this->render('stock/index.html.twig', [
            'stocks' => $repository->findBy([], ['designation' => 'ASC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_stock_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $stock = new Stock();
        $form = $this->createForm(StockType::class, $stock);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($stock);
            $em->flush();
            $this->addFlash('success', 'Article ajouté au stock.');
            return $this->redirectToRoute('app_stock_index');
        }

        return $this->render('stock/form.html.twig', ['form' => $form, 'title' => 'Nouvel article']);
    }

    #[Route('/{id}/modifier', name: 'app_stock_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Stock $stock, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(StockType::class, $stock);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Article modifié.');
            return $this->redirectToRoute('app_stock_index');
        }

        return $this->render('stock/form.html.twig', ['form' => $form, 'title' => 'Modifier l\'article']);
    }

    #[Route('/{id}/supprimer', name: 'app_stock_delete', methods: ['POST'])]
    public function delete(Request $request, Stock $stock, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$stock->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($stock);
            $em->flush();
            $this->addFlash('success', 'Article supprimé.');
        }
        return $this->redirectToRoute('app_stock_index');
    }
}
