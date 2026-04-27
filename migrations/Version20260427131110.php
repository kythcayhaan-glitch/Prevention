<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260427131110 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE rqth_document (id INT AUTO_INCREMENT NOT NULL, rqth_id INT NOT NULL, filename VARCHAR(255) NOT NULL, nom_original VARCHAR(255) NOT NULL, INDEX IDX_rqth_id (rqth_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4 ENGINE=MyISAM');
        $this->addSql('ALTER TABLE rqth DROP document_rqth, DROP document_rqth_nom');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE rqth_document');
        $this->addSql('ALTER TABLE rqth ADD document_rqth VARCHAR(255) DEFAULT NULL, ADD document_rqth_nom VARCHAR(255) DEFAULT NULL');
    }
}
