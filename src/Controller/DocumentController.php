<?php

namespace App\Controller;

use App\Entity\Document;
use App\Repository\DocumentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\DependencyInjection\Attribute\Autowire;

#[Route('/documents')]
class DocumentController extends AbstractController
{
    private string $uploadDir;

    public function __construct(#[Autowire('%kernel.project_dir%')] string $projectDir)
    {
        $this->uploadDir = $projectDir . '/var/uploads/documents';
    }

    #[Route('/upload', name: 'app_document_upload', methods: ['POST'])]
    public function upload(Request $request, EntityManagerInterface $em, SluggerInterface $slugger): Response
    {
        $file = $request->files->get('fichier');
        $nom  = trim($request->request->get('nom', ''));

        if (!$file || !$file->isValid()) {
            $this->addFlash('error', 'Fichier invalide.');
            return $this->redirectToRoute('app_dashboard');
        }

        if (!is_dir($this->uploadDir)) {
            mkdir($this->uploadDir, 0775, true);
        }

        if (!$nom) {
            $nom = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        }

        $ext        = $file->getClientOriginalExtension();
        $safeName   = $slugger->slug($nom) . '-' . uniqid() . '.' . $ext;
        $taille     = $file->getSize();
        $file->move($this->uploadDir, $safeName);

        $doc = new Document();
        $doc->setNom($nom)
            ->setNomFichier($safeName)
            ->setMimeType(null)
            ->setTaille($taille ?: filesize($this->uploadDir . '/' . $safeName))
            ->setDateAjout(new \DateTimeImmutable());

        $em->persist($doc);
        $em->flush();

        $this->addFlash('success', 'Document ajouté avec succès.');
        return $this->redirectToRoute('app_dashboard');
    }

    #[Route('/{id}/download', name: 'app_document_download')]
    public function download(Document $doc): BinaryFileResponse
    {
        $path = $this->uploadDir . '/' . $doc->getNomFichier();

        if (!file_exists($path)) {
            throw $this->createNotFoundException('Fichier introuvable.');
        }

        $response = new BinaryFileResponse($path);
        $response->headers->set('Content-Disposition',
            'attachment; filename="' . addslashes($doc->getNom() . '.' . pathinfo($doc->getNomFichier(), PATHINFO_EXTENSION)) . '"'
        );
        $response->headers->set('Content-Type', 'application/octet-stream');
        return $response;
    }

    #[Route('/{id}/delete', name: 'app_document_delete', methods: ['POST'])]
    public function delete(Document $doc, EntityManagerInterface $em, Request $request): Response
    {
        if ($this->isCsrfTokenValid('delete-doc-' . $doc->getId(), $request->request->get('_token'))) {
            $path = $this->uploadDir . '/' . $doc->getNomFichier();
            if (file_exists($path)) unlink($path);
            $em->remove($doc);
            $em->flush();
            $this->addFlash('success', 'Document supprimé.');
        }
        return $this->redirectToRoute('app_dashboard');
    }
}
