<?php

namespace App\Entity;

use App\Repository\StockRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: StockRepository::class)]
#[ORM\Table(name: 'stock')]
class Stock
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $designation = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix = null;

    #[ORM\Column(nullable: true)]
    private ?int $stockMini = null;

    #[ORM\Column(nullable: true)]
    private ?int $stockReel = null;

    #[ORM\Column(nullable: true)]
    private ?int $donnee = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $ref = null;

    public function getId(): ?int { return $this->id; }

    public function getDesignation(): ?string { return $this->designation; }
    public function setDesignation(?string $designation): static { $this->designation = $designation; return $this; }

    public function getPrix(): ?string { return $this->prix; }
    public function setPrix(?string $prix): static { $this->prix = $prix; return $this; }

    public function getStockMini(): ?int { return $this->stockMini; }
    public function setStockMini(?int $stockMini): static { $this->stockMini = $stockMini; return $this; }

    public function getStockReel(): ?int { return $this->stockReel; }
    public function setStockReel(?int $stockReel): static { $this->stockReel = $stockReel; return $this; }

    public function getDonnee(): ?int { return $this->donnee; }
    public function setDonnee(?int $donnee): static { $this->donnee = $donnee; return $this; }

    public function getRef(): ?string { return $this->ref; }
    public function setRef(?string $ref): static { $this->ref = $ref; return $this; }
}
