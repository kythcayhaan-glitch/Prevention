<?php

namespace App\Repository;

use App\Entity\VisiteDate;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class VisiteDateRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, VisiteDate::class);
    }

    public function findAllWithVisite(): array
    {
        return $this->createQueryBuilder('vd')
            ->join('vd.visite', 'v')
            ->addSelect('v')
            ->where('vd.date IS NOT NULL')
            ->andWhere('vd.date != :empty')
            ->setParameter('empty', '')
            ->orderBy('vd.date', 'ASC')
            ->getQuery()
            ->getResult();
    }
}
