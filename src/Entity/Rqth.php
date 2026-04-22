<?php

namespace App\Entity;

use App\Repository\RqthRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RqthRepository::class)]
#[ORM\Table(name: 'rqth')]
class Rqth
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $genre = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $agentRqth = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $prenomRqth = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $poleServiceRqth = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $emploiRqth = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $etatRqth = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $dateAttributionRqth = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $dateFinAttributionRqth = null;

    public function getId(): ?int { return $this->id; }

    public function getGenre(): ?string { return $this->genre; }
    public function setGenre(?string $genre): static { $this->genre = $genre; return $this; }

    public function getAgentRqth(): ?string { return $this->agentRqth; }
    public function setAgentRqth(?string $agentRqth): static { $this->agentRqth = $agentRqth; return $this; }

    public function getPrenomRqth(): ?string { return $this->prenomRqth; }
    public function setPrenomRqth(?string $prenomRqth): static { $this->prenomRqth = $prenomRqth; return $this; }

    public function getPoleServiceRqth(): ?string { return $this->poleServiceRqth; }
    public function setPoleServiceRqth(?string $poleServiceRqth): static { $this->poleServiceRqth = $poleServiceRqth; return $this; }

    public function getEmploiRqth(): ?string { return $this->emploiRqth; }
    public function setEmploiRqth(?string $emploiRqth): static { $this->emploiRqth = $emploiRqth; return $this; }

    public function getEtatRqth(): ?string { return $this->etatRqth; }
    public function setEtatRqth(?string $etatRqth): static { $this->etatRqth = $etatRqth; return $this; }

    public function getDateAttributionRqth(): ?string { return $this->dateAttributionRqth; }
    public function setDateAttributionRqth(?string $dateAttributionRqth): static { $this->dateAttributionRqth = $dateAttributionRqth; return $this; }

    public function getDateFinAttributionRqth(): ?string { return $this->dateFinAttributionRqth; }
    public function setDateFinAttributionRqth(?string $dateFinAttributionRqth): static { $this->dateFinAttributionRqth = $dateFinAttributionRqth; return $this; }
}
