<?php

namespace App\Controller;

use App\Entity\Visite;
use App\Entity\VisiteDate;
use App\Form\VisiteType;
use App\Repository\VisiteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpKernel\KernelInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/visite')]
class VisiteController extends AbstractController
{
    #[Route('/', name: 'app_visite_index')]
    public function index(VisiteRepository $repository): Response
    {
        return $this->render('visite/index.html.twig', [
            'visites' => $repository->findBy([], ['id' => 'DESC']),
        ]);
    }

    #[Route('/nouveau', name: 'app_visite_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $visite = new Visite();
        $form = $this->createForm(VisiteType::class, $visite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $visite->setUserVisite($this->getUser()->getUserIdentifier());
            $em->persist($visite);
            $em->flush();
            $this->addFlash('success', 'Visite ajoutée avec succès.');
            return $this->redirectToRoute('app_visite_index');
        }

        return $this->render('visite/form.html.twig', [
            'form' => $form,
            'title' => 'Nouvelle visite de prévention',
        ]);
    }

    #[Route('/{id}', name: 'app_visite_show')]
    public function show(Visite $visite): Response
    {
        return $this->render('visite/show.html.twig', ['visite' => $visite]);
    }

    #[Route('/{id}/modifier', name: 'app_visite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(VisiteType::class, $visite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Visite modifiée avec succès.');
            return $this->redirectToRoute('app_visite_show', ['id' => $visite->getId()]);
        }

        return $this->render('visite/form.html.twig', [
            'form' => $form,
            'title' => 'Modifier la visite',
            'visite' => $visite,
        ]);
    }

    #[Route('/{id}/autosave', name: 'app_visite_autosave', methods: ['POST'])]
    public function autosave(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(VisiteType::class, $visite, ['csrf_protection' => false]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            return new Response('ok', 200);
        }

        return new Response('error', 422);
    }

    #[Route('/{id}/convocation/{dateId}', name: 'app_visite_convocation', methods: ['GET'])]
    public function convocation(Visite $visite, int $dateId, EntityManagerInterface $em, KernelInterface $kernel): Response
    {
        $date = $em->getRepository(VisiteDate::class)->find($dateId);
        if (!$date) throw $this->createNotFoundException();

        $template = match ($date->getCategorie()) {
            'MDP'  => 'medecin.docx',
            default => 'infirmier.docx',
        };

        $templatePath = $kernel->getProjectDir() . '/convocations/' . $template;
        $varTmp  = $kernel->getProjectDir() . '/var/tmp';
        if (!is_dir($varTmp)) mkdir($varTmp, 0777, true);
        $tmpDocx = $varTmp . '/conv_' . uniqid() . '.docx';
        $tmpDir  = $varTmp . '/out_' . uniqid();

        // Charger le docx, remplacer les champs, sauvegarder
        $zip = new \ZipArchive();
        $zip->open($templatePath);
        $xml = $zip->getFromName('word/document.xml');
        $zip->close();

        $mois = ['janvier','février','mars','avril','mai','juin','juillet','août','septembre','octobre','novembre','décembre'];
        $dateJour = (int)(new \DateTime())->format('j') . ' ' . $mois[(int)(new \DateTime())->format('n') - 1] . ' ' . (new \DateTime())->format('Y');

        $replacements = [
            '«Titre»'  => htmlspecialchars($visite->getGenre() ?? '', ENT_XML1),
            '«Agents»' => htmlspecialchars(trim(($visite->getAgentVisite() ?? '') . ' ' . ($visite->getPrenomVisite() ?? '')), ENT_XML1),
            '«C»'      => (string) $date->getId(),
            '«Date»'   => htmlspecialchars($date->getDate() ?? '', ENT_XML1),
            '«Heure»'  => htmlspecialchars($date->getHeure() ?? '', ENT_XML1),
        ];

        $xml = str_replace(array_keys($replacements), array_values($replacements), $xml);

        copy($templatePath, $tmpDocx);
        $zip->open($tmpDocx);
        $zip->addFromString('word/document.xml', $xml);
        $zip->close();

        // Conversion PDF via LibreOffice
        mkdir($tmpDir, 0777, true);
        $soffice = file_exists('/usr/bin/libreoffice')
            ? '/usr/bin/libreoffice'
            : 'C:/Program Files/LibreOffice/program/soffice.exe';

        $loProfile = $kernel->getProjectDir() . '/var/tmp/lo_profile';
        if (!is_dir($loProfile)) mkdir($loProfile, 0777, true);
        $loProfileUri = 'file://' . str_replace('\\', '/', $loProfile);

        $cmd = '"' . $soffice . '" --headless --norestore'
            . ' "-env:UserInstallation=' . $loProfileUri . '"'
            . ' --convert-to pdf --outdir "' . $tmpDir . '" "' . $tmpDocx . '"';
        exec($cmd . ' 2>&1', $output, $returnCode);

        $pdfFile = $tmpDir . '/' . pathinfo($tmpDocx, PATHINFO_FILENAME) . '.pdf';

        if ($returnCode !== 0 || !file_exists($pdfFile)) {
            $logFile = $varTmp . '/conv_error.log';
            file_put_contents($logFile, date('Y-m-d H:i:s') . "\nCMD: $cmd\nCode: $returnCode\nOutput: " . implode("\n", $output) . "\npdfFile: $pdfFile\nexists: " . (file_exists($pdfFile) ? 'oui' : 'non') . "\n\n", FILE_APPEND);
            @unlink($tmpDocx);
            @array_map('unlink', glob($tmpDir . '/*') ?: []);
            @rmdir($tmpDir);
            throw new \RuntimeException('Échec conversion PDF (code ' . $returnCode . '): ' . implode(' ', $output) . ' | CMD: ' . $cmd);
        }

        $pdf = file_get_contents($pdfFile);
        unlink($tmpDocx);
        unlink($pdfFile);
        rmdir($tmpDir);

        $nom = strtolower(str_replace(' ', '_', $visite->getAgentVisite() ?? 'convocation'));
        return new Response($pdf, 200, [
            'Content-Type'        => 'application/pdf',
            'Content-Disposition' => 'inline; filename="convocation_' . $nom . '.pdf"',
        ]);
    }

    #[Route('/{id}/supprimer', name: 'app_visite_delete', methods: ['POST'])]
    public function delete(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$visite->getId(), $request->getPayload()->getString('_token'))) {
            $em->remove($visite);
            $em->flush();
            $this->addFlash('success', 'Visite supprimée.');
        }
        return $this->redirectToRoute('app_visite_index');
    }
}
