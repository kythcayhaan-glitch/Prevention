<?php

namespace App\Entity;

use App\Repository\VisiteDateRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: VisiteDateRepository::class)]
#[ORM\Table(name: 'visite_date')]
class VisiteDate
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $date = null;

    #[ORM\Column(length: 15, nullable: true)]
    private ?string $type = null; // 'realisee' | 'prochaine'

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $categorie = null; // 'ESTI' | 'MDP' | 'VP'

    #[ORM\ManyToOne(inversedBy: 'dates')]
    #[ORM\JoinColumn(nullable: false, onDelete: 'CASCADE')]
    private ?Visite $visite = null;

    public function getId(): ?int { return $this->id; }

    public function getDate(): ?string { return $this->date; }
    public function setDate(?string $date): static { $this->date = $date; return $this; }

    public function getType(): ?string { return $this->type; }
    public function setType(?string $type): static { $this->type = $type; return $this; }

    public function getCategorie(): ?string { return $this->categorie; }
    public function setCategorie(?string $categorie): static { $this->categorie = $categorie; return $this; }

    public function getVisite(): ?Visite { return $this->visite; }
    public function setVisite(?Visite $visite): static { $this->visite = $visite; return $this; }
}
