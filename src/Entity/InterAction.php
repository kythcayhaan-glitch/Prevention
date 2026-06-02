<?php

namespace App\Entity;

use App\Repository\InterActionRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InterActionRepository::class)]
#[ORM\Table(name: 'inter_action')]
class InterAction
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $date = null;

    #[ORM\Column(type: 'text', nullable: true)]
    private ?string $description = null;

    #[ORM\ManyToOne(inversedBy: 'actions')]
    #[ORM\JoinColumn(nullable: false, onDelete: 'CASCADE')]
    private ?Inter $inter = null;

    public function getId(): ?int { return $this->id; }

    public function getDate(): ?string { return $this->date; }
    public function setDate(?string $date): static { $this->date = $date; return $this; }

    public function getDescription(): ?string { return $this->description; }
    public function setDescription(?string $description): static { $this->description = $description; return $this; }

    public function getInter(): ?Inter { return $this->inter; }
    public function setInter(?Inter $inter): static { $this->inter = $inter; return $this; }
}
