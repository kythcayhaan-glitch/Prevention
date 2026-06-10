<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260610072355 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE permis_document ADD permis_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE permis_document ADD CONSTRAINT FK_93E3D1B83594A24E FOREIGN KEY (permis_id) REFERENCES permis (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_93E3D1B83594A24E ON permis_document (permis_id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE permis_document DROP FOREIGN KEY FK_93E3D1B83594A24E');
        $this->addSql('DROP INDEX IDX_93E3D1B83594A24E ON permis_document');
        $this->addSql('ALTER TABLE permis_document DROP permis_id');
    }
}
