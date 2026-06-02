<?php

namespace App\Repository;

use App\Entity\Fiphfp;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class FiphfpRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Fiphfp::class);
    }

    public function countByEtat(): array
    {
        return $this->createQueryBuilder('f')
            ->select('f.etatDemandeFiphfp as etat, COUNT(f.id) as total')
            ->where('f.etatDemandeFiphfp IS NOT NULL')
            ->groupBy('f.etatDemandeFiphfp')
            ->orderBy('total', 'DESC')
            ->getQuery()->getArrayResult();
    }

    public function sumMontants(): array
    {
        return $this->createQueryBuilder('f')
            ->select('SUM(f.montantDepenseFiphfp) as depense, SUM(f.montantAccordeFiphfp) as accorde, SUM(f.resteACharge) as reste')
            ->getQuery()->getOneOrNullResult();
    }

    public function countByTypeReste(): array
    {
        return $this->createQueryBuilder('f')
            ->select('f.typeResteACharge as type, COUNT(f.id) as total, SUM(f.resteACharge) as montant')
            ->where('f.typeResteACharge IS NOT NULL')
            ->groupBy('f.typeResteACharge')
            ->getQuery()->getArrayResult();
    }

    public function topObjets(): array
    {
        return $this->createQueryBuilder('f')
            ->select('f.objetFiphfp as objet, COUNT(f.id) as total')
            ->where('f.objetFiphfp IS NOT NULL')
            ->groupBy('f.objetFiphfp')
            ->orderBy('total', 'DESC')
            ->setMaxResults(5)
            ->getQuery()->getArrayResult();
    }
}
