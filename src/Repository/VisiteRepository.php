<?php

namespace App\Repository;

use App\Entity\Visite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class VisiteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Visite::class);
    }

    /**
     * Retourne les statistiques de visites par année.
     * Chaque date (dateVisite + prochaineDateVisite) compte comme 1 visite.
     */
    public function getStatsByAnnee(?string $annee = null): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $where = $annee ? "WHERE annee = :annee" : "";

        $sql = "
            SELECT annee, agent, pole_service, COUNT(*) as nb_visites
            FROM (
                SELECT SUBSTRING(date_visite, 7, 4) as annee, agent_visite as agent, pole_service_visite as pole_service
                FROM visite WHERE date_visite IS NOT NULL AND date_visite != ''
                UNION ALL
                SELECT SUBSTRING(prochaine_date_visite, 7, 4) as annee, agent_visite as agent, pole_service_visite as pole_service
                FROM visite WHERE prochaine_date_visite IS NOT NULL AND prochaine_date_visite != ''
            ) as toutes_dates
            $where
            GROUP BY annee, agent, pole_service
            ORDER BY annee DESC, nb_visites DESC
        ";

        $stmt = $conn->prepare($sql);
        if ($annee) {
            $stmt->bindValue('annee', $annee);
        }
        $result = $stmt->executeQuery();
        return $result->fetchAllAssociative();
    }

    public function getTotalByAnnee(?string $annee = null): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $where = $annee ? "WHERE annee = :annee" : "";

        $sql = "
            SELECT annee, COUNT(*) as nb_visites
            FROM (
                SELECT SUBSTRING(date_visite, 7, 4) as annee
                FROM visite WHERE date_visite IS NOT NULL AND date_visite != ''
                UNION ALL
                SELECT SUBSTRING(prochaine_date_visite, 7, 4) as annee
                FROM visite WHERE prochaine_date_visite IS NOT NULL AND prochaine_date_visite != ''
            ) as toutes_dates
            $where
            GROUP BY annee
            ORDER BY annee DESC
        ";

        $stmt = $conn->prepare($sql);
        if ($annee) {
            $stmt->bindValue('annee', $annee);
        }
        $result = $stmt->executeQuery();
        return $result->fetchAllAssociative();
    }

    public function getAnneesDisponibles(): array
    {
        $conn = $this->getEntityManager()->getConnection();
        $sql = "
            SELECT DISTINCT annee FROM (
                SELECT SUBSTRING(date_visite, 7, 4) as annee FROM visite WHERE date_visite IS NOT NULL AND date_visite != ''
                UNION
                SELECT SUBSTRING(prochaine_date_visite, 7, 4) as annee FROM visite WHERE prochaine_date_visite IS NOT NULL AND prochaine_date_visite != ''
            ) a WHERE annee IS NOT NULL AND annee != '' ORDER BY annee DESC
        ";
        return $conn->fetchFirstColumn($sql);
    }
}
