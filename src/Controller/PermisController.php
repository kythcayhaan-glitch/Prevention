<?php

namespace App\Controller;

use App\Entity\Permis;
use App\Entity\PermisConvocation;
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
use Symfony\Component\HttpKernel\KernelInterface;
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

    // ── Convocation ──

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/convocation', name: 'app_permis_convocation', methods: ['GET', 'POST'])]
    public function convocation(Request $request, Permis $permis, EntityManagerInterface $em, KernelInterface $kernel): Response
    {
        if ($request->isMethod('GET')) {
            return $this->render('permis/convocation.html.twig', ['permis' => $permis]);
        }

        $dateRdv = trim($request->request->get('date', ''));
        $heureRdv = trim($request->request->get('heure', ''));

        if (!$dateRdv || !$heureRdv) {
            $this->addFlash('error', 'Date et heure obligatoires.');
            return $this->render('permis/convocation.html.twig', ['permis' => $permis]);
        }

        // Enregistrer pour avoir l'id (= référence «C»)
        $conv = new PermisConvocation();
        $conv->setPermis($permis);
        $em->persist($conv);
        $em->flush();

        // TypePermis : types cochés dans la modale, filtrés aux valeurs valides
        $selected = array_values(array_filter(
            $request->request->all('types') ?: [],
            fn($t) => in_array($t, ['C', 'D', 'E', 'FIMO', 'FCO', 'Poids lourd'], true)
        ));
        $nb = count($selected);
        $typePermis = match ($nb) {
            0       => '',
            1       => $selected[0],
            2       => $selected[0] . ' et ' . $selected[1],
            default => implode(', ', array_slice($selected, 0, -1)) . ' et ' . end($selected),
        };

        $templatePath = $kernel->getProjectDir() . '/convocations/permi.docx';
        $varTmp = $kernel->getProjectDir() . '/var/tmp';
        if (!is_dir($varTmp)) mkdir($varTmp, 0777, true);
        $tmpDocx = $varTmp . '/conv_permis_' . uniqid() . '.docx';
        $tmpDir  = $varTmp . '/out_' . uniqid();

        $zip = new \ZipArchive();
        $zip->open($templatePath);
        $xml = $zip->getFromName('word/document.xml');
        $zip->close();

        $mois  = ['janvier','février','mars','avril','mai','juin','juillet','août','septembre','octobre','novembre','décembre'];
        $jours = ['lundi','mardi','mercredi','jeudi','vendredi','samedi','dimanche'];
        $now = new \DateTime();
        $dateJour = (int)$now->format('j') . ' ' . $mois[(int)$now->format('n') - 1] . ' ' . $now->format('Y');

        $formatDate = function (string $d) use ($mois, $jours): string {
            if (!preg_match('#^(\d{2})/(\d{2})/(\d{4})$#', $d, $p)) return $d;
            $dt = \DateTime::createFromFormat('d/m/Y', $d);
            $nomJour = $dt ? $jours[(int)$dt->format('N') - 1] . ' ' : '';
            return $nomJour . (int)$p[1] . ' ' . $mois[(int)$p[2] - 1] . ' ' . $p[3];
        };

        $replacements = [
            '«Titre»'      => htmlspecialchars($permis->getGenre() ?? '', ENT_XML1),
            '«Agents»'     => htmlspecialchars(trim($permis->getNom() . ' ' . $permis->getPrenom()), ENT_XML1),
            '«DateJour»'   => $dateJour,
            '«C»'          => (string) $conv->getId(),
            '«TypePermis»' => htmlspecialchars($typePermis, ENT_XML1),
            '«Date»'       => htmlspecialchars($formatDate($dateRdv), ENT_XML1),
            '«Heure»'      => htmlspecialchars(preg_replace('/^(\d{2}):(\d{2})$/', '$1h$2', $heureRdv), ENT_XML1),
        ];

        $xml = preg_replace_callback(
            '/«[^»]*»/u',
            fn($m) => preg_replace('/<[^>]+>/u', '', $m[0]),
            $xml
        );
        $xml = str_replace(array_keys($replacements), array_values($replacements), $xml);

        copy($templatePath, $tmpDocx);
        $zip->open($tmpDocx);
        $zip->addFromString('word/document.xml', $xml);
        $zip->close();

        mkdir($tmpDir, 0777, true);
        $soffice = file_exists('/usr/bin/libreoffice') ? '/usr/bin/libreoffice' : 'C:/Program Files/LibreOffice/program/soffice.exe';
        $loProfile = $varTmp . '/lo_profile';
        if (!is_dir($loProfile)) mkdir($loProfile, 0777, true);
        $loProfileUri = 'file:///' . str_replace('\\', '/', $loProfile);

        $cmd = '"' . $soffice . '" --headless --norestore'
            . ' "-env:UserInstallation=' . $loProfileUri . '"'
            . ' --convert-to pdf --outdir "' . $tmpDir . '" "' . $tmpDocx . '"';
        exec($cmd . ' 2>&1', $output, $returnCode);

        $pdfFile = $tmpDir . '/' . pathinfo($tmpDocx, PATHINFO_FILENAME) . '.pdf';

        if ($returnCode !== 0 || !file_exists($pdfFile)) {
            @unlink($tmpDocx);
            @array_map('unlink', glob($tmpDir . '/*') ?: []);
            @rmdir($tmpDir);
            throw new \RuntimeException('Échec PDF (code ' . $returnCode . '): ' . implode(' ', $output));
        }

        $pdf = file_get_contents($pdfFile);
        unlink($tmpDocx);
        unlink($pdfFile);
        rmdir($tmpDir);

        $nom = strtolower(str_replace(' ', '_', $permis->getNom()));
        return new Response($pdf, 200, [
            'Content-Type'        => 'application/pdf',
            'Content-Disposition' => 'inline; filename="convocation_permis_' . $nom . '.pdf"',
        ]);
    }

    // ── Documents ──

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{id}/document/upload', name: 'app_permis_agent_doc_upload', methods: ['POST'])]
    public function uploadAgentDoc(Request $request, Permis $permis, EntityManagerInterface $em, SluggerInterface $slugger): Response
    {
        $file = $request->files->get('fichier');
        $nom  = trim($request->request->get('nom', ''));

        if (!$file || !$file->isValid()) {
            $this->addFlash('error', 'Fichier invalide.');
            return $this->redirectToRoute('app_permis_edit', ['id' => $permis->getId()]);
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
            ->setTaille($taille ?: filesize($this->uploadDir . '/' . $safeName))
            ->setPermis($permis);

        $em->persist($doc);
        $em->flush();

        $this->addFlash('success', 'Document ajouté.');
        return $this->redirectToRoute('app_permis_edit', ['id' => $permis->getId()]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/{permisId}/document/{docId}/supprimer', name: 'app_permis_agent_doc_delete', methods: ['POST'])]
    public function deleteAgentDoc(Request $request, int $permisId, int $docId, PermisDocumentRepository $docRepository, EntityManagerInterface $em): Response
    {
        $doc = $docRepository->find($docId);

        if ($doc && $this->isCsrfTokenValid('delete-agent-doc-' . $docId, $request->request->get('_token'))) {
            $path = $this->uploadDir . '/' . $doc->getNomFichier();
            if (file_exists($path)) {
                unlink($path);
            }
            $em->remove($doc);
            $em->flush();
            $this->addFlash('success', 'Document supprimé.');
        }

        return $this->redirectToRoute('app_permis_edit', ['id' => $permisId]);
    }

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
