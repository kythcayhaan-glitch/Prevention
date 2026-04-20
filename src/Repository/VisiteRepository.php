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

    public function findProchainesVisites(): array
    {
        return $this->createQueryBuilder('v')
            ->join('v.dates', 'd')
            ->where('d.type = :type')
            ->andWhere('d.date IS NOT NULL')
            ->andWhere('d.date != :empty')
            ->setParameter('type', 'prochaine')
            ->setParameter('empty', '')
            ->orderBy('d.date', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function getStatsByAnnee(?string $annee = null): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $where = $annee ? "WHERE annee = :annee" : "";

        $sql = "
            SELECT annee, agent, pole_service, COUNT(*) as nb_visites
            FROM (
                SELECT SUBSTRING(vd.date, 7, 4) as annee, TRIM(CONCAT(COALESCE(v.agent_visite,''), ' ', COALESCE(v.prenom_visite,''))) as agent, v.pole_service_visite as pole_service
                FROM visite_date vd
                JOIN visite v ON vd.visite_id = v.id
                WHERE vd.date IS NOT NULL AND vd.date != '' AND vd.type = 'realisee'
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
                SELECT SUBSTRING(vd.date, 7, 4) as annee
                FROM visite_date vd
                WHERE vd.date IS NOT NULL AND vd.date != '' AND vd.type = 'realisee'
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
            SELECT DISTINCT SUBSTRING(vd.date, 7, 4) as annee
            FROM visite_date vd
            WHERE vd.date IS NOT NULL AND vd.date != '' AND vd.type = 'realisee'
            ORDER BY annee DESC
        ";
        return $conn->fetchFirstColumn($sql);
    }
}
