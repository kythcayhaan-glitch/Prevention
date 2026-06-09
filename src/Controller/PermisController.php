<?php

namespace App\Controller;

use App\Entity\Permis;
use App\Entity\PermisDocument;
use App\Form\PermisType;
use App\Repository\PermisDocumentRepository;
use App\Repository\PermisRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\DependencyInjection\Attribute\Autowire;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/permis')]
class PermisController extends AbstractController
{
    private string $uploadDir;

    public function __construct(#[Autowire('%kernel.project_dir%')] string $projectDir)
    {
        $this->uploadDir = $projectDir . '/var/uploads/permis';
    }

    #[Route('/', name: 'app_permis_index')]
    public function index(PermisRepository $repository, PermisDocumentRepository $docRepository): Response
    {
        return $this->render('permis/index.html.twig', [
            'permis'    => $repository->findBy([], ['nom' => 'ASC']),
            'documents' => $docRepository->findBy([], ['dateAjout' => 'DESC']),
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
            'form'   => $form,
            'title'  => 'Nouveau permis',
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
            'form'   => $form,
            'title'  => 'Modifier — ' . $permis->getNomComplet(),
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

    // ── Documents ──

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/document/upload', name: 'app_permis_doc_upload', methods: ['POST'])]
    public function uploadDoc(Request $request, EntityManagerInterface $em, SluggerInterface $slugger): Response
    {
        $file = $request->files->get('fichier');
        $nom  = trim($request->request->get('nom', ''));

        if (!$file || !$file->isValid()) {
            $this->addFlash('error', 'Fichier invalide.');
            return $this->redirectToRoute('app_permis_index');
        }

        if (!is_dir($this->uploadDir)) {
            mkdir($this->uploadDir, 0775, true);
        }

        if (!$nom) {
            $nom = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        }

        $ext      = $file->getClientOriginalExtension();
        $safeName = $slugger->slug($nom) . '-' . uniqid() . '.' . $ext;
        $taille   = $file->getSize();
        $file->move($this->uploadDir, $safeName);

        $doc = new PermisDocument();
        $doc->setNom($nom)
            ->setNomFichier($safeName)
            ->setTaille($taille ?: filesize($this->uploadDir . '/' . $safeName));

        $em->persist($doc);
        $em->flush();

        $this->addFlash('success', 'Document ajouté.');
        return $this->redirectToRoute('app_permis_index');
    }

    #[Route('/document/{id}/download', name: 'app_permis_doc_download')]
    public function downloadDoc(PermisDocument $doc): BinaryFileResponse
    {
        $path = $this->uploadDir . '/' . $doc->getNomFichier();

        if (!file_exists($path)) {
            throw $this->createNotFoundException('Fichier introuvable.');
        }

        $ext     = strtolower(pathinfo($doc->getNomFichier(), PATHINFO_EXTENSION));
        $mimeMap = [
            'pdf'  => 'application/pdf',
            'jpg'  => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png',
            'doc'  => 'application/msword',
            'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            'xls'  => 'application/vnd.ms-excel',
            'xlsx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        ];

        $response = new BinaryFileResponse($path);
        $response->headers->set('Content-Type', $mimeMap[$ext] ?? 'application/octet-stream');
        $response->setContentDisposition(ResponseHeaderBag::DISPOSITION_INLINE, $doc->getNom() . '.' . $ext);
        return $response;
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/document/{id}/supprimer', name: 'app_permis_doc_delete', methods: ['POST'])]
    public function deleteDoc(Request $request, PermisDocument $doc, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete-doc-' . $doc->getId(), $request->request->get('_token'))) {
            $path = $this->uploadDir . '/' . $doc->getNomFichier();
            if (file_exists($path)) {
                unlink($path);
            }
            $em->remove($doc);
            $em->flush();
            $this->addFlash('success', 'Document supprimé.');
        }
        return $this->redirectToRoute('app_permis_index');
    }
}
