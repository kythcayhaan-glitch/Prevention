<?php

namespace App\Repository;

use App\Entity\Inter;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class InterRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Inter::class);
    }

    public function countByUrgence(): array
    {
        return $this->createQueryBuilder('i')
            ->select('i.urgence as urgence, COUNT(i.id) as total')
            ->where('i.urgence IS NOT NULL')
            ->groupBy('i.urgence')
            ->getQuery()->getArrayResult();
    }

    public function countByService(): array
    {
        return $this->createQueryBuilder('i')
            ->select('i.service as service, COUNT(i.id) as total')
            ->where('i.service IS NOT NULL')
            ->groupBy('i.service')
            ->orderBy('total', 'DESC')
            ->setMaxResults(10)
            ->getQuery()->getArrayResult();
    }

    public function topAgents(): array
    {
        return $this->createQueryBuilder('i')
            ->select('i.agentVisite as agent, COUNT(i.id) as total')
            ->where('i.agentVisite IS NOT NULL')
            ->groupBy('i.agentVisite')
            ->orderBy('total', 'DESC')
            ->setMaxResults(5)
            ->getQuery()->getArrayResult();
    }

    public function countByMonth(): array
    {
        $all = $this->findAll();
        $months = [];
        foreach ($all as $inter) {
            $date = $inter->getDate();
            if (!$date) continue;
            $parts = explode('/', $date);
            if (count($parts) !== 3) continue;
            $key = $parts[2] . '-' . $parts[1];
            $months[$key] = ($months[$key] ?? 0) + 1;
        }
        krsort($months);
        return array_slice($months, 0, 12, true);
    }
}
