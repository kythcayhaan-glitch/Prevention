<?php

namespace App\Controller;

use App\Entity\Rqth;
use App\Entity\RqthDocument;
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
            $this->handleUploads($request, $rqth);
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
            $this->handleUploads($request, $rqth);
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

    #[Route('/{id}/document/{docId}/supprimer', name: 'app_rqth_document_delete', methods: ['POST'])]
    public function deleteDocument(Request $request, Rqth $rqth, int $docId, EntityManagerInterface $em): Response
    {
        if (!$this->isCsrfTokenValid('delete-doc' . $docId, $request->getPayload()->getString('_token'))) {
            return $this->redirectToRoute('app_rqth_show', ['id' => $rqth->getId()]);
        }

        foreach ($rqth->getDocuments() as $doc) {
            if ($doc->getId() === $docId) {
                $this->deleteFile($doc->getFilename());
                $rqth->removeDocument($doc);
                $em->remove($doc);
                break;
            }
        }

        $em->flush();
        $this->addFlash('success', 'Document supprimé.');
        return $this->redirectToRoute('app_rqth_show', ['id' => $rqth->getId()]);
    }

    #[Route('/{id}/supprimer', name: 'app_rqth_delete', methods: ['POST'])]
    public function delete(Request $request, Rqth $rqth, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete' . $rqth->getId(), $request->getPayload()->getString('_token'))) {
            foreach ($rqth->getDocuments() as $doc) {
                $this->deleteFile($doc->getFilename());
            }
            $em->remove($rqth);
            $em->flush();
            $this->addFlash('success', 'RQTH supprimé.');
        }
        return $this->redirectToRoute('app_rqth_index');
    }

    private function handleUploads(Request $request, Rqth $rqth): void
    {
        $files = $request->files->get('documentFiles') ?? [];
        if (!is_array($files)) {
            $files = [$files];
        }

        $uploadDir = $this->getParameter('kernel.project_dir') . '/public/uploads/rqth';

        foreach ($files as $file) {
            if (!$file) {
                continue;
            }
            $originalName = $file->getClientOriginalName();
            $ext = pathinfo($originalName, PATHINFO_EXTENSION) ?: 'pdf';
            $filename = uniqid('rqth_') . '.' . $ext;
            $file->move($uploadDir, $filename);

            $doc = new RqthDocument();
            $doc->setFilename($filename);
            $doc->setNomOriginal($originalName);
            $rqth->addDocument($doc);
        }
    }

    private function deleteFile(string $filename): void
    {
        $path = $this->getParameter('kernel.project_dir') . '/public/uploads/rqth/' . $filename;
        if (file_exists($path)) {
            unlink($path);
        }
    }
}
