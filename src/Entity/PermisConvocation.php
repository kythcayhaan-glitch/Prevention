<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'permis_convocation')]
class PermisConvocation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false, onDelete: 'CASCADE')]
    private ?Permis $permis = null;

    #[ORM\Column(type: 'datetime_immutable')]
    private \DateTimeImmutable $dateGeneration;

    public function __construct()
    {
        $this->dateGeneration = new \DateTimeImmutable();
    }

    public function getId(): ?int { return $this->id; }

    public function getPermis(): ?Permis { return $this->permis; }
    public function setPermis(?Permis $permis): static { $this->permis = $permis; return $this; }

    public function getDateGeneration(): \DateTimeImmutable { return $this->dateGeneration; }
}
