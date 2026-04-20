<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20260420000001 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Création du schéma initial CELINE Symfony';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE `user` (
            id INT AUTO_INCREMENT NOT NULL,
            login VARCHAR(60) NOT NULL,
            password VARCHAR(255) NOT NULL,
            id_profil INT NOT NULL DEFAULT 0,
            nom VARCHAR(60) NOT NULL,
            service VARCHAR(60) NOT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE batiments (
            id INT AUTO_INCREMENT NOT NULL,
            designation VARCHAR(60) NOT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE service (
            id INT AUTO_INCREMENT NOT NULL,
            service VARCHAR(60) NOT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE intervenant (
            id INT AUTO_INCREMENT NOT NULL,
            nom VARCHAR(60) NOT NULL,
            service VARCHAR(60) NOT NULL,
            taux_inter DECIMAL(10,2) NOT NULL DEFAULT 0.00,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE stock (
            id INT AUTO_INCREMENT NOT NULL,
            designation VARCHAR(255) DEFAULT NULL,
            prix DECIMAL(10,2) DEFAULT NULL,
            stock_mini INT DEFAULT NULL,
            stock_reel INT DEFAULT NULL,
            donnee INT DEFAULT NULL,
            ref VARCHAR(60) DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE visite (
            id INT AUTO_INCREMENT NOT NULL,
            agent_visite VARCHAR(255) DEFAULT NULL,
            pole_service_visite VARCHAR(255) DEFAULT NULL,
            date_visite VARCHAR(10) DEFAULT NULL,
            observation VARCHAR(255) DEFAULT NULL,
            rqth_visite VARCHAR(10) DEFAULT NULL,
            restriction_visite VARCHAR(1000) DEFAULT NULL,
            user_visite VARCHAR(60) DEFAULT NULL,
            type VARCHAR(60) DEFAULT NULL,
            recommandation_visite VARCHAR(1000) DEFAULT NULL,
            limitation_visite VARCHAR(1000) DEFAULT NULL,
            temps_partiel_visite VARCHAR(3) DEFAULT NULL,
            tpt1_du VARCHAR(10) DEFAULT NULL, tpt1_au VARCHAR(10) DEFAULT NULL,
            tpt2_du VARCHAR(10) DEFAULT NULL, tpt2_au VARCHAR(10) DEFAULT NULL,
            tpt3_du VARCHAR(10) DEFAULT NULL, tpt3_au VARCHAR(10) DEFAULT NULL,
            tpt4_du VARCHAR(10) DEFAULT NULL, tpt4_au VARCHAR(10) DEFAULT NULL,
            qte1 INT DEFAULT NULL, qte2 INT DEFAULT NULL,
            qte3 INT DEFAULT NULL, qte4 INT DEFAULT NULL,
            emploi_visite VARCHAR(255) DEFAULT NULL,
            tdt_oui_non VARCHAR(3) DEFAULT NULL,
            travail_penche_visite INT DEFAULT NULL,
            debout_visite INT DEFAULT NULL,
            conduite_visite INT DEFAULT NULL,
            utilisation_visite INT DEFAULT NULL,
            travail_haut_visite INT DEFAULT NULL,
            travail_iso_visite INT DEFAULT NULL,
            travail_bas_visite INT DEFAULT NULL,
            effort_visite INT DEFAULT NULL,
            port VARCHAR(10) DEFAULT NULL,
            epi VARCHAR(3) DEFAULT NULL,
            epi_detail VARCHAR(1000) DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE rqth (
            id INT AUTO_INCREMENT NOT NULL,
            agent_rqth VARCHAR(255) DEFAULT NULL,
            pole_service_rqth VARCHAR(255) DEFAULT NULL,
            emploi_rqth VARCHAR(255) DEFAULT NULL,
            etat_rqth VARCHAR(1000) DEFAULT NULL,
            date_attribution_rqth VARCHAR(10) DEFAULT NULL,
            date_fin_attribution_rqth VARCHAR(10) DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE fiphfp (
            id INT AUTO_INCREMENT NOT NULL,
            agent_fiphfp VARCHAR(100) DEFAULT NULL,
            pole_fiphfp VARCHAR(100) DEFAULT NULL,
            demande_fiphfp VARCHAR(100) DEFAULT NULL,
            date_demande_fiphfp VARCHAR(10) DEFAULT NULL,
            objet_fiphfp VARCHAR(255) DEFAULT NULL,
            etat_demande_fiphfp VARCHAR(255) DEFAULT NULL,
            detail_demande_fiphfp VARCHAR(1000) DEFAULT NULL,
            montant_depense_fiphfp INT DEFAULT NULL,
            montant_demande_fiphfp INT DEFAULT NULL,
            montant_accorde_fiphfp INT DEFAULT NULL,
            accord_paye_le VARCHAR(10) DEFAULT NULL,
            urgence_fiphfp INT DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE inter (
            id INT AUTO_INCREMENT NOT NULL,
            date VARCHAR(10) DEFAULT NULL,
            heure INT DEFAULT NULL,
            service VARCHAR(100) DEFAULT NULL,
            panne_annonce VARCHAR(255) DEFAULT NULL,
            cout_matos DECIMAL(10,2) DEFAULT NULL,
            inter_effect VARCHAR(1000) DEFAULT NULL,
            duree DECIMAL(10,2) DEFAULT NULL,
            intervenant VARCHAR(1000) DEFAULT NULL,
            taux_intervenant DECIMAL(10,2) DEFAULT NULL,
            intervenant2 VARCHAR(60) DEFAULT NULL,
            taux_intervenant2 DECIMAL(10,2) DEFAULT NULL,
            intervenant3 VARCHAR(60) DEFAULT NULL,
            taux_intervenant3 DECIMAL(10,2) DEFAULT NULL,
            agent_visite VARCHAR(255) DEFAULT NULL,
            agent_rqth VARCHAR(255) DEFAULT NULL,
            pole_service_visite VARCHAR(255) DEFAULT NULL,
            pole_service_rqth VARCHAR(255) DEFAULT NULL,
            date_visite VARCHAR(60) DEFAULT NULL,
            observation VARCHAR(255) DEFAULT NULL,
            rqth_visite VARCHAR(3) DEFAULT NULL,
            restriction_visite VARCHAR(1000) DEFAULT NULL,
            user_inter VARCHAR(60) DEFAULT NULL,
            urgence VARCHAR(5) DEFAULT NULL,
            type VARCHAR(60) DEFAULT NULL,
            recommandation_visite VARCHAR(1000) DEFAULT NULL,
            limitation_visite VARCHAR(1000) DEFAULT NULL,
            temps_partiel_visite VARCHAR(3) DEFAULT NULL,
            tpt1_du VARCHAR(10) DEFAULT NULL, tpt1_au VARCHAR(10) DEFAULT NULL,
            tpt2_du VARCHAR(10) DEFAULT NULL, tpt2_au VARCHAR(10) DEFAULT NULL,
            tpt3_du VARCHAR(10) DEFAULT NULL, tpt3_au VARCHAR(10) DEFAULT NULL,
            tpt4_du VARCHAR(10) DEFAULT NULL, tpt4_au VARCHAR(10) DEFAULT NULL,
            emploi_visite VARCHAR(255) DEFAULT NULL,
            emploi_rqth VARCHAR(255) DEFAULT NULL,
            prix1 DECIMAL(10,2) DEFAULT NULL,
            etat_rqth VARCHAR(1000) DEFAULT NULL,
            taux_total DECIMAL(10,2) DEFAULT NULL,
            par VARCHAR(60) DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');

        $this->addSql('CREATE TABLE inter_ok (
            id INT AUTO_INCREMENT NOT NULL,
            date VARCHAR(10) DEFAULT NULL,
            heure INT DEFAULT NULL,
            service VARCHAR(100) DEFAULT NULL,
            panne_annonce LONGTEXT DEFAULT NULL,
            cout_matos DECIMAL(10,2) DEFAULT NULL,
            inter_effect VARCHAR(1000) DEFAULT NULL,
            duree DECIMAL(10,2) DEFAULT NULL,
            intervenant VARCHAR(1000) DEFAULT NULL,
            taux_intervenant DECIMAL(10,2) DEFAULT NULL,
            intervenant2 VARCHAR(60) DEFAULT NULL,
            taux_intervenant2 DECIMAL(10,2) DEFAULT NULL,
            intervenant3 VARCHAR(60) DEFAULT NULL,
            taux_intervenant3 DECIMAL(10,2) DEFAULT NULL,
            intervenant4 VARCHAR(255) DEFAULT NULL,
            taux_intervenant4 DECIMAL(10,2) DEFAULT NULL,
            intervenant5 VARCHAR(60) DEFAULT NULL,
            taux_intervenant5 DECIMAL(10,2) DEFAULT NULL,
            cout_intervention INT DEFAULT NULL,
            observation VARCHAR(255) DEFAULT NULL,
            date_enregistrer DATE DEFAULT NULL,
            date_terminer VARCHAR(10) DEFAULT NULL,
            user_inter VARCHAR(60) DEFAULT NULL,
            urgence VARCHAR(5) DEFAULT NULL,
            type VARCHAR(60) DEFAULT NULL,
            matos1 VARCHAR(60) DEFAULT NULL, quantite1 INT DEFAULT NULL, prix1 DECIMAL(10,2) DEFAULT NULL,
            matos2 VARCHAR(60) DEFAULT NULL, quantite2 INT DEFAULT NULL, prix2 DECIMAL(10,2) DEFAULT NULL,
            matos3 VARCHAR(60) DEFAULT NULL, quantite3 INT DEFAULT NULL, prix3 DECIMAL(10,2) DEFAULT NULL,
            matos4 VARCHAR(60) DEFAULT NULL, quantite4 INT DEFAULT NULL, prix4 DECIMAL(10,2) DEFAULT NULL,
            matos5 VARCHAR(60) DEFAULT NULL, quantite5 INT DEFAULT NULL, prix5 DECIMAL(10,2) DEFAULT NULL,
            taux_total DECIMAL(10,2) DEFAULT NULL,
            par VARCHAR(60) DEFAULT NULL,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE IF EXISTS inter_ok');
        $this->addSql('DROP TABLE IF EXISTS inter');
        $this->addSql('DROP TABLE IF EXISTS fiphfp');
        $this->addSql('DROP TABLE IF EXISTS rqth');
        $this->addSql('DROP TABLE IF EXISTS visite');
        $this->addSql('DROP TABLE IF EXISTS stock');
        $this->addSql('DROP TABLE IF EXISTS intervenant');
        $this->addSql('DROP TABLE IF EXISTS service');
        $this->addSql('DROP TABLE IF EXISTS batiments');
        $this->addSql('DROP TABLE IF EXISTS `user`');
    }
}
