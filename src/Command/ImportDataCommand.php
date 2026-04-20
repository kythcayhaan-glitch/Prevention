<?php

namespace App\Command;

use App\Entity\Batiment;
use App\Entity\Fiphfp;
use App\Entity\Inter;
use App\Entity\InterOk;
use App\Entity\Intervenant;
use App\Entity\Rqth;
use App\Entity\Service;
use App\Entity\Stock;
use App\Entity\User;
use App\Entity\Visite;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

#[AsCommand(
    name: 'app:import-data',
    description: 'Importe les données depuis la base MySQL CELINE originale',
)]
class ImportDataCommand extends Command
{
    public function __construct(
        private EntityManagerInterface $em,
        private UserPasswordHasherInterface $hasher,
    ) {
        parent::__construct();
    }

    protected function configure(): void
    {
        $this->addArgument('dsn', InputArgument::OPTIONAL, 'DSN MySQL source', 'mysql:host=127.0.0.1;dbname=celine;charset=utf8');
        $this->addArgument('user', InputArgument::OPTIONAL, 'Utilisateur MySQL source', 'Iatides');
        $this->addArgument('password', InputArgument::OPTIONAL, 'Mot de passe MySQL source', 'Sopxsopx23@@');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $io->title('Import des données CELINE');

        try {
            $pdo = new \PDO(
                $input->getArgument('dsn'),
                $input->getArgument('user'),
                $input->getArgument('password'),
                [
                    \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                    \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES latin1",
                ]
            );
        } catch (\PDOException $e) {
            $io->error('Connexion impossible à la base source : ' . $e->getMessage());
            return Command::FAILURE;
        }

        $io->success('Connexion à la base source OK');

        $batchSize = 50;
        $i = 0;

        // Users
        $io->section('Import des utilisateurs');
        $stmt = $pdo->query('SELECT * FROM user');
        foreach ($stmt as $row) {
            $user = new User();
            $user->setLogin($row['login']);
            $user->setNom($row['nom']);
            $user->setService($row['service']);
            $user->setIdProfil((int)$row['id_profil']);
            // Hash the plaintext password from legacy system
            $user->setPassword($this->hasher->hashPassword($user, $row['password']));
            $this->em->persist($user);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Utilisateurs importés');

        // Batiments
        $io->section('Import des bâtiments');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM batiments');
        foreach ($stmt as $row) {
            $b = new Batiment();
            $b->setDesignation($row['designation']);
            $this->em->persist($b);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Bâtiments importés');

        // Services
        $io->section('Import des services');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM service');
        foreach ($stmt as $row) {
            $s = new Service();
            $s->setService($row['service']);
            $this->em->persist($s);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Services importés');

        // Intervenants
        $io->section('Import des intervenants');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM intervenant');
        foreach ($stmt as $row) {
            $iv = new Intervenant();
            $iv->setNom($row['nom']);
            $iv->setService($row['service']);
            $iv->setTauxInter($row['taux_inter']);
            $this->em->persist($iv);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Intervenants importés');

        // Stock
        $io->section('Import du stock');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM stock');
        foreach ($stmt as $row) {
            $st = new Stock();
            $st->setDesignation($row['designation']);
            $st->setPrix($row['prix']);
            $st->setStockMini($row['stock_mini']);
            $st->setStockReel($row['stock_reel']);
            $st->setDonnee($row['donnee']);
            $st->setRef($row['ref']);
            $this->em->persist($st);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Stock importé');

        // Visites
        $io->section('Import des visites');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM visite');
        foreach ($stmt as $row) {
            $v = new Visite();
            $v->setAgentVisite($row['agent_visite']);
            $v->setPoleServiceVisite($row['pole_service_visite']);
            $v->setDateVisite($row['date_visite']);
            $v->setObservation($row['observation']);
            $v->setRqthVisite($row['rqth_visite']);
            $v->setRestrictionVisite($row['restriction_visite']);
            $v->setUserVisite($row['user']);
            $v->setType($row['type']);
            $v->setRecommandationVisite($row['recommandation_visite']);
            $v->setLimitationVisite($row['limitation_visite']);
            $v->setTempsPartielVisite($row['temps_partiel_visite']);
            $v->setTpt1Du($row['tpt1_du']); $v->setTpt1Au($row['tpt1_au']);
            $v->setTpt2Du($row['tpt2_du']); $v->setTpt2Au($row['tpt2_au']);
            $v->setTpt3Du($row['tpt3_du']); $v->setTpt3Au($row['tpt3_au']);
            $v->setTpt4Du($row['tpt4_du']); $v->setTpt4Au($row['tpt4_au']);
            $v->setQte1($row['qte1']); $v->setQte2($row['qte2']);
            $v->setQte3($row['qte3']); $v->setQte4($row['qte4']);
            $v->setEmploiVisite($row['emploi_visite']);
            $v->setTdtOuiNon($row['tdt_oui_non']);
            $v->setTravailPencheVisite($row['travail_penche_visite']);
            $v->setDeboutVisite($row['debout_visite']);
            $v->setConduiteVisite($row['conduite_visite']);
            $v->setUtilisationVisite($row['utilisation_visite']);
            $v->setTravailHautVisite($row['travail_haut_visite']);
            $v->setTravailIsoVisite($row['travail_iso_visite']);
            $v->setTravailBasVisite($row['travail_bas_visite']);
            $v->setEffortVisite($row['effort__visite']);
            $v->setPort($row['port']);
            $v->setEpi($row['epi']);
            $v->setEpiDetail($row['epi_detail']);
            $this->em->persist($v);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Visites importées : ' . $i);

        // RQTH
        $io->section('Import des RQTH');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM rqth');
        foreach ($stmt as $row) {
            $r = new Rqth();
            $r->setAgentRqth($row['agent_rqth']);
            $r->setPoleServiceRqth($row['pole_service_rqth']);
            $r->setEmploiRqth($row['emploi_rqth']);
            $r->setEtatRqth($row['etat_rqth']);
            $r->setDateAttributionRqth($row['date_attribution_rqth']);
            $r->setDateFinAttributionRqth($row['date_fin_attribution_rqth']);
            $this->em->persist($r);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('RQTH importés : ' . $i);

        // FIPHFP
        $io->section('Import des FIPHFP');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM fiphfp');
        foreach ($stmt as $row) {
            $f = new Fiphfp();
            $f->setAgentFiphfp($row['agent_fiphfp']);
            $f->setPoleFiphfp($row['pole_fiphfp']);
            $f->setDemandeFiphfp($row['demande_fiphfp']);
            $f->setDateDemandeFiphfp($row['date_demande_fiphfp']);
            $f->setObjetFiphfp($row['objet_fiphfp']);
            $f->setEtatDemandeFiphfp($row['etat_demande_fiphfp']);
            $f->setDetailDemandeFiphfp($row['detail_demande_fiphfp']);
            $f->setMontantDepenseFiphfp($row['montant_depense_fiphfp']);
            $f->setMontantDemandeFiphfp($row['montant_demande_fiphfp']);
            $f->setMontantAccordeFiphfp($row['montant_accorde_fiphfp']);
            $f->setAccordPayeLe($row['accord_paye_le']);
            $f->setUrgenceFiphfp($row['urgence_fiphfp']);
            $this->em->persist($f);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('FIPHFP importés : ' . $i);

        // Inter
        $io->section('Import des interventions (inter)');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM inter');
        foreach ($stmt as $row) {
            $in = new Inter();
            $in->setDate($row['date']);
            $in->setHeure($row['heure']);
            $in->setService($row['service']);
            $in->setPanneAnnonce($row['panne_annonce']);
            $in->setCoutMatos($row['cout_matos']);
            $in->setInterEffect($row['inter_effect']);
            $in->setDuree($row['duree']);
            $in->setIntervenant($row['intervenant']);
            $in->setTauxIntervenant($row['taux_intervenant']);
            $in->setIntervenant2($row['intervenant2']);
            $in->setTauxIntervenant2($row['taux_intervenant2']);
            $in->setIntervenant3($row['intervenant3']);
            $in->setTauxIntervenant3($row['taux_intervenant3']);
            $in->setAgentVisite($row['agent_visite']);
            $in->setAgentRqth($row['agent_rqth']);
            $in->setPoleServiceVisite($row['pole_service_visite']);
            $in->setPoleServiceRqth($row['pole_service_rqth']);
            $in->setDateVisite($row['date_visite']);
            $in->setObservation($row['observation']);
            $in->setRqthVisite($row['rqth_visite']);
            $in->setRestrictionVisite($row['restriction_visite']);
            $in->setUserInter($row['user']);
            $in->setUrgence($row['urgence']);
            $in->setType($row['type']);
            $in->setRecommandationVisite($row['recommandation_visite']);
            $in->setLimitationVisite($row['limitation_visite']);
            $in->setTempsPartielVisite($row['temps_partiel_visite']);
            $in->setTpt1Du($row['tpt1_du']); $in->setTpt1Au($row['tpt1_au']);
            $in->setTpt2Du($row['tpt2_du']); $in->setTpt2Au($row['tpt2_au']);
            $in->setTpt3Du($row['tpt3_du']); $in->setTpt3Au($row['tpt3_au']);
            $in->setTpt4Du($row['tpt4_du']); $in->setTpt4Au($row['tpt4_au']);
            $in->setEmploiVisite($row['emploi_visite']);
            $in->setEmploiRqth($row['emploi_rqth']);
            $in->setPrix1($row['prix1']);
            $in->setEtatRqth($row['etat_rqth']);
            $in->setTauxTotal($row['taux_total']);
            $in->setPar($row['par']);
            $this->em->persist($in);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Interventions importées : ' . $i);

        // InterOk
        $io->section('Import des interventions terminées (inter_ok)');
        $i = 0;
        $stmt = $pdo->query('SELECT * FROM inter_ok');
        foreach ($stmt as $row) {
            $io2 = new InterOk();
            $io2->setDate($row['date']);
            $io2->setHeure($row['heure']);
            $io2->setService($row['service']);
            $io2->setPanneAnnonce($row['panne_annonce']);
            $io2->setCoutMatos($row['cout_matos']);
            $io2->setInterEffect($row['inter_effect']);
            $io2->setDuree($row['duree']);
            $io2->setIntervenant($row['intervenant']);
            $io2->setTauxIntervenant($row['taux_intervenant']);
            $io2->setIntervenant2($row['intervenant2']);
            $io2->setTauxIntervenant2($row['taux_intervenant2']);
            $io2->setIntervenant3($row['intervenant3']);
            $io2->setTauxIntervenant3($row['taux_intervenant3']);
            $io2->setIntervenant4($row['intervenant4']);
            $io2->setTauxIntervenant4($row['taux_intervenant4']);
            $io2->setIntervenant5($row['intervenant5']);
            $io2->setTauxIntervenant5($row['taux_intervenant5']);
            $io2->setCoutIntervention($row['cout_intervention']);
            $io2->setObservation($row['observation']);
            if (!empty($row['date_enregistrer'])) {
                $io2->setDateEnregistrer(new \DateTime($row['date_enregistrer']));
            }
            $io2->setDateTerminer($row['date_terminer']);
            $io2->setUserInter($row['user']);
            $io2->setUrgence($row['urgence']);
            $io2->setType($row['type']);
            $io2->setMatos1($row['matos1']); $io2->setQuantite1($row['quantite1']); $io2->setPrix1($row['prix1']);
            $io2->setMatos2($row['matos2']); $io2->setQuantite2($row['quantite2']); $io2->setPrix2($row['prix2']);
            $io2->setMatos3($row['matos3']); $io2->setQuantite3($row['quantite3']); $io2->setPrix3($row['prix3']);
            $io2->setMatos4($row['matos4']); $io2->setQuantite4($row['quantite4']); $io2->setPrix4($row['prix4']);
            $io2->setMatos5($row['matos5']); $io2->setQuantite5($row['quantite5']); $io2->setPrix5($row['prix5']);
            $io2->setTauxTotal($row['taux_total']);
            $io2->setPar($row['par']);
            $this->em->persist($io2);
            if (++$i % $batchSize === 0) { $this->em->flush(); $this->em->clear(); }
        }
        $this->em->flush();
        $io->success('Interventions terminées importées : ' . $i);

        $io->success('Import terminé avec succès !');
        return Command::SUCCESS;
    }
}
