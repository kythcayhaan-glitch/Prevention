<?php

namespace App\Entity;

use App\Repository\IntervenantRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IntervenantRepository::class)]
#[ORM\Table(name: 'intervenant')]
class Intervenant
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 60)]
    private string $nom = '';

    #[ORM\Column(length: 60)]
    private string $service = '';

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private string $tauxInter = '0.00';

    public function getId(): ?int { return $this->id; }

    public function getNom(): string { return $this->nom; }
    public function setNom(string $nom): static { $this->nom = $nom; return $this; }

    public function getService(): string { return $this->service; }
    public function setService(string $service): static { $this->service = $service; return $this; }

    public function getTauxInter(): string { return $this->tauxInter; }
    public function setTauxInter(string $tauxInter): static { $this->tauxInter = $tauxInter; return $this; }

    public function __toString(): string { return $this->nom; }
}
