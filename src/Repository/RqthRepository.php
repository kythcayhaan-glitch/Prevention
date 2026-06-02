<?php

namespace App\Repository;

use App\Entity\Rqth;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class RqthRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Rqth::class);
    }

    public function countByEtat(): array
    {
        return $this->createQueryBuilder('r')
            ->select('r.etatRqth as etat, COUNT(r.id) as total')
            ->where('r.etatRqth IS NOT NULL')
            ->groupBy('r.etatRqth')
            ->orderBy('total', 'DESC')
            ->getQuery()->getArrayResult();
    }

    public function countByService(): array
    {
        return $this->createQueryBuilder('r')
            ->select('r.poleServiceRqth as service, COUNT(r.id) as total')
            ->where('r.poleServiceRqth IS NOT NULL')
            ->groupBy('r.poleServiceRqth')
            ->orderBy('total', 'DESC')
            ->setMaxResults(10)
            ->getQuery()->getArrayResult();
    }

    public function findExpiringWithin(int $months): array
    {
        $all = $this->findAll();
        $limit = new \DateTime("+{$months} months");
        $today = new \DateTime();
        $result = [];
        foreach ($all as $rqth) {
            $fin = $rqth->getDateFinAttributionRqth();
            if (!$fin) continue;
            $parts = explode('/', $fin);
            if (count($parts) !== 3) continue;
            try {
                $date = new \DateTime($parts[2] . '-' . $parts[1] . '-' . $parts[0]);
                if ($date >= $today && $date <= $limit) {
                    $result[] = $rqth;
                }
            } catch (\Exception $e) {}
        }
        return $result;
    }
}
