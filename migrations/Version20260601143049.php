<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260601143049 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE visite');
        $this->addSql('DROP TABLE visite_date');
        $this->addSql('DROP TABLE visite_piece_jointe');
        $this->addSql('ALTER TABLE inter CHANGE urgence urgence VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE rqth_document ADD CONSTRAINT FK_F658FC9B4D2545D9 FOREIGN KEY (rqth_id) REFERENCES rqth (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE rqth_document RENAME INDEX idx_rqth_id TO IDX_F658FC9B4D2545D9');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE visite (id INT AUTO_INCREMENT NOT NULL, agent_visite VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, prenom_visite VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, pole_service_visite VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, observation VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, rqth_visite VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, restriction_visite VARCHAR(1000) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, user_visite VARCHAR(60) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, type VARCHAR(60) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, recommandation_visite VARCHAR(1000) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, limitation_visite VARCHAR(1000) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, temps_partiel_visite VARCHAR(3) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt1_du VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt1_au VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt2_du VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt2_au VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt3_du VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt3_au VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt4_du VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tpt4_au VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, qte1 INT DEFAULT NULL, qte2 INT DEFAULT NULL, qte3 INT DEFAULT NULL, qte4 INT DEFAULT NULL, emploi_visite VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, tdt_oui_non VARCHAR(3) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, travail_penche_visite INT DEFAULT NULL, debout_visite INT DEFAULT NULL, conduite_visite INT DEFAULT NULL, utilisation_visite INT DEFAULT NULL, travail_haut_visite INT DEFAULT NULL, travail_iso_visite INT DEFAULT NULL, travail_bas_visite INT DEFAULT NULL, effort_visite INT DEFAULT NULL, port VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, epi VARCHAR(3) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, epi_detail VARCHAR(1000) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, genre VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_unicode_ci`, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb3 COLLATE `utf8mb3_unicode_ci` ENGINE = MyISAM COMMENT = \'\' ');
        $this->addSql('CREATE TABLE visite_date (id INT AUTO_INCREMENT NOT NULL, visite_id INT NOT NULL, date VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_general_ci`, type VARCHAR(15) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_general_ci`, categorie VARCHAR(10) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_general_ci`, heure VARCHAR(5) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_general_ci`, annulee TINYINT DEFAULT 0 NOT NULL, motif_annulation VARCHAR(255) CHARACTER SET utf8mb3 DEFAULT NULL COLLATE `utf8mb3_general_ci`, INDEX IDX_27EF98CBC1C5DC59 (visite_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb3 COLLATE `utf8mb3_general_ci` ENGINE = MyISAM COMMENT = \'\' ');
        $this->addSql('CREATE TABLE visite_piece_jointe (id INT AUTO_INCREMENT NOT NULL, visite_id INT NOT NULL, nom VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_general_ci`, nom_fichier VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_general_ci`, taille INT DEFAULT NULL, date_ajout DATETIME NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_general_ci` ENGINE = MyISAM COMMENT = \'\' ');
        $this->addSql('ALTER TABLE inter CHANGE urgence urgence VARCHAR(5) DEFAULT NULL');
        $this->addSql('ALTER TABLE rqth_document DROP FOREIGN KEY FK_F658FC9B4D2545D9');
        $this->addSql('ALTER TABLE rqth_document RENAME INDEX idx_f658fc9b4d2545d9 TO IDX_rqth_id');
    }
}
