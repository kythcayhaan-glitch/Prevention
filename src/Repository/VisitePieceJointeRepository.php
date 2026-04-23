<?php

namespace App\Repository;

use App\Entity\VisitePieceJointe;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class VisitePieceJointeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, VisitePieceJointe::class);
    }

    /** Retourne un tableau indexé par visite_id avec le nombre de PJ */
    public function countByVisite(): array
    {
        $rows = $this->createQueryBuilder('p')
            ->select('p.visiteId, COUNT(p.id) as nb')
            ->groupBy('p.visiteId')
            ->getQuery()
            ->getArrayResult();

        $map = [];
        foreach ($rows as $row) {
            $map[$row['visiteId']] = (int) $row['nb'];
        }
        return $map;
    }
}
