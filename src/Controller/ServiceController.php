<?php

namespace App\Controller;

use App\Entity\Service;
use App\Form\ServiceType;
use App\Repository\ServiceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/service')]
#[IsGranted('ROLE_ADMIN')]
class ServiceController extends AbstractController
{
    #[Route('/', name: 'app_service_index')]
    public function index(ServiceRepository $repository): Response
    {
        return $this->render('service/index.html.twig', [
            'services' => $repository->findBy([], ['service' => 'ASC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_service_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $service = new Service();
        $form = $this->createForm(ServiceType::class, $service);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($service);
            $em->flush();
            $this->addFlash('success', 'Service ajouté.');
            return $this->redirectToRoute('app_service_index');
        }

        return $this->render('service/form.html.twig', ['form' => $form, 'title' => 'Nouveau service']);
    }

    #[Route('/{id}/modifier', name: 'app_service_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Service $service, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(ServiceType::class, $service);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Service modifié.');
            return $this->redirectToRoute('app_service_index');
        }

        return $this->render('service/form.html.twig', ['form' => $form, 'title' => 'Modifier le service']);
    }

    #[Route('/{id}/supprimer', name: 'app_service_delete', methods: ['POST'])]
    public function delete(Request $request, Service $service, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$service->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($service);
            $em->flush();
            $this->addFlash('success', 'Service supprimé.');
        }
        return $this->redirectToRoute('app_service_index');
    }
}
