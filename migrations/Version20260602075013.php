<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260602075013 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE inter_action (id INT AUTO_INCREMENT NOT NULL, date VARCHAR(10) DEFAULT NULL, description LONGTEXT DEFAULT NULL, inter_id INT NOT NULL, INDEX IDX_E83CEE43E858909E (inter_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE inter_action ADD CONSTRAINT FK_E83CEE43E858909E FOREIGN KEY (inter_id) REFERENCES inter (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE inter_action DROP FOREIGN KEY FK_E83CEE43E858909E');
        $this->addSql('DROP TABLE inter_action');
    }
}
