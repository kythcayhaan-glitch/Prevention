<?php

namespace App\Controller;

use App\Entity\Visite;
use App\Entity\VisiteDate;
use App\Form\FicheSuiviType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class FicheSuiviController extends AbstractController
{
    #[Route('/visite/{id}/fiche-suivi', name: 'app_visite_fiche_suivi', methods: ['GET', 'POST'])]
    public function index(Request $request, Visite $visite, EntityManagerInterface $em): Response
    {
        $realisees = $visite->getDates()->filter(fn($d) => $d->getType() === 'realisee')->toArray();
        usort($realisees, fn($a, $b) => strcmp($a->getDate() ?? '', $b->getDate() ?? ''));
        $derniereRealisee = !empty($realisees) ? end($realisees) : null;

        $form = $this->createForm(FicheSuiviType::class, $visite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Passer toutes les dates prévues en réalisées
            foreach ($visite->getDates() as $vd) {
                if ($vd->getType() === 'prochaine') {
                    $vd->setType('realisee');
                }
            }

            // Ajouter la prochaine visite si renseignée
            $prochaineDate = $form->get('prochaineDate')->getData();
            if ($prochaineDate) {
                $vd = new VisiteDate();
                $vd->setDate($prochaineDate);
                $vd->setType('prochaine');
                $vd->setCategorie($form->get('prochaineCategorie')->getData());
                $vd->setVisite($visite);
                $em->persist($vd);
            }

            $em->flush();
            $this->addFlash('success', 'Fiche enregistrée. Visite marquée comme réalisée.' . ($prochaineDate ? ' Prochaine visite ajoutée au calendrier.' : ''));
            return $this->redirectToRoute('app_visite_index');
        }

        return $this->render('visite/fiche_suivi.html.twig', [
            'visite' => $visite,
            'realisees' => $realisees,
            'derniere_realisee' => $derniereRealisee,
            'form' => $form,
        ]);
    }
}
