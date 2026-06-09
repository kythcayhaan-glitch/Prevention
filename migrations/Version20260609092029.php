<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260609092029 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE permis_convocation (id INT AUTO_INCREMENT NOT NULL, date_generation DATETIME NOT NULL, permis_id INT NOT NULL, INDEX IDX_F286AFF3594A24E (permis_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE permis_convocation ADD CONSTRAINT FK_F286AFF3594A24E FOREIGN KEY (permis_id) REFERENCES permis (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE permis ADD genre VARCHAR(20) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE permis_convocation DROP FOREIGN KEY FK_F286AFF3594A24E');
        $this->addSql('DROP TABLE permis_convocation');
        $this->addSql('ALTER TABLE permis DROP genre');
    }
}
