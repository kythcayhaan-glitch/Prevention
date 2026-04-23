<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20260423130740 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Suppression batiments/intervenants, table visite_piece_jointe déjà créée (MyISAM : pas de FK)';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('DROP TABLE IF EXISTS batiments');
        $this->addSql('DROP TABLE IF EXISTS intervenant');
        // visite est en MyISAM : les contraintes FK ne sont pas supportées
    }

    public function down(Schema $schema): void
    {
    }
}
