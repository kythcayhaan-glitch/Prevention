<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20260420000002 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout prochaine_date_visite dans la table visite';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE visite ADD prochaine_date_visite VARCHAR(10) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE visite DROP COLUMN prochaine_date_visite');
    }
}
