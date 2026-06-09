<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260609080638 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE permis (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(100) NOT NULL, prenom VARCHAR(100) DEFAULT NULL, permis_cobtention VARCHAR(10) DEFAULT NULL, permis_cvalidite VARCHAR(10) DEFAULT NULL, permis_dobtention VARCHAR(10) DEFAULT NULL, permis_dvalidite VARCHAR(10) DEFAULT NULL, permis_eobtention VARCHAR(10) DEFAULT NULL, permis_evalidite VARCHAR(10) DEFAULT NULL, fimo_type VARCHAR(20) DEFAULT NULL, fimo_obtention VARCHAR(7) DEFAULT NULL, fimo_prochaine VARCHAR(7) DEFAULT NULL, fco_obtention VARCHAR(7) DEFAULT NULL, fco_prochaine VARCHAR(7) DEFAULT NULL, visite_medicale_realisee VARCHAR(7) DEFAULT NULL, visite_medicale_prochaine VARCHAR(7) DEFAULT NULL, notes VARCHAR(1000) DEFAULT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE permis');
    }
}
