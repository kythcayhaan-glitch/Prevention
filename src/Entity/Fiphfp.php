<?php

namespace App\Entity;

use App\Repository\FiphfpRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FiphfpRepository::class)]
#[ORM\Table(name: 'fiphfp')]
class Fiphfp
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $genre = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $agentFiphfp = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $prenomFiphfp = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $poleFiphfp = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $demandeFiphfp = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $dateDemandeFiphfp = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $objetFiphfp = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $etatDemandeFiphfp = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $detailDemandeFiphfp = null;

    #[ORM\Column(nullable: true)]
    private ?int $montantDepenseFiphfp = null;

    #[ORM\Column(nullable: true)]
    private ?int $montantDemandeFiphfp = null;

    #[ORM\Column(nullable: true)]
    private ?int $montantAccordeFiphfp = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $accordPayeLe = null;

    #[ORM\Column(nullable: true)]
    private ?int $urgenceFiphfp = null;

    public function getId(): ?int { return $this->id; }

    public function getGenre(): ?string { return $this->genre; }
    public function setGenre(?string $genre): static { $this->genre = $genre; return $this; }

    public function getAgentFiphfp(): ?string { return $this->agentFiphfp; }
    public function setAgentFiphfp(?string $agentFiphfp): static { $this->agentFiphfp = $agentFiphfp; return $this; }

    public function getPrenomFiphfp(): ?string { return $this->prenomFiphfp; }
    public function setPrenomFiphfp(?string $prenomFiphfp): static { $this->prenomFiphfp = $prenomFiphfp; return $this; }

    public function getPoleFiphfp(): ?string { return $this->poleFiphfp; }
    public function setPoleFiphfp(?string $poleFiphfp): static { $this->poleFiphfp = $poleFiphfp; return $this; }

    public function getDemandeFiphfp(): ?string { return $this->demandeFiphfp; }
    public function setDemandeFiphfp(?string $demandeFiphfp): static { $this->demandeFiphfp = $demandeFiphfp; return $this; }

    public function getDateDemandeFiphfp(): ?string { return $this->dateDemandeFiphfp; }
    public function setDateDemandeFiphfp(?string $dateDemandeFiphfp): static { $this->dateDemandeFiphfp = $dateDemandeFiphfp; return $this; }

    public function getObjetFiphfp(): ?string { return $this->objetFiphfp; }
    public function setObjetFiphfp(?string $objetFiphfp): static { $this->objetFiphfp = $objetFiphfp; return $this; }

    public function getEtatDemandeFiphfp(): ?string { return $this->etatDemandeFiphfp; }
    public function setEtatDemandeFiphfp(?string $etatDemandeFiphfp): static { $this->etatDemandeFiphfp = $etatDemandeFiphfp; return $this; }

    public function getDetailDemandeFiphfp(): ?string { return $this->detailDemandeFiphfp; }
    public function setDetailDemandeFiphfp(?string $detailDemandeFiphfp): static { $this->detailDemandeFiphfp = $detailDemandeFiphfp; return $this; }

    public function getMontantDepenseFiphfp(): ?int { return $this->montantDepenseFiphfp; }
    public function setMontantDepenseFiphfp(?int $montantDepenseFiphfp): static { $this->montantDepenseFiphfp = $montantDepenseFiphfp; return $this; }

    public function getMontantDemandeFiphfp(): ?int { return $this->montantDemandeFiphfp; }
    public function setMontantDemandeFiphfp(?int $montantDemandeFiphfp): static { $this->montantDemandeFiphfp = $montantDemandeFiphfp; return $this; }

    public function getMontantAccordeFiphfp(): ?int { return $this->montantAccordeFiphfp; }
    public function setMontantAccordeFiphfp(?int $montantAccordeFiphfp): static { $this->montantAccordeFiphfp = $montantAccordeFiphfp; return $this; }

    public function getAccordPayeLe(): ?string { return $this->accordPayeLe; }
    public function setAccordPayeLe(?string $accordPayeLe): static { $this->accordPayeLe = $accordPayeLe; return $this; }

    public function getUrgenceFiphfp(): ?int { return $this->urgenceFiphfp; }
    public function setUrgenceFiphfp(?int $urgenceFiphfp): static { $this->urgenceFiphfp = $urgenceFiphfp; return $this; }
}
