<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260427130809 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE rqth ADD document_rqth_nom VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE visite_date ADD CONSTRAINT FK_27EF98CBC1C5DC59 FOREIGN KEY (visite_id) REFERENCES visite (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE rqth DROP document_rqth_nom');
        $this->addSql('ALTER TABLE visite_date DROP FOREIGN KEY FK_27EF98CBC1C5DC59');
    }
}
