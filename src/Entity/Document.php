<?php

namespace App\Entity;

use App\Repository\DocumentRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DocumentRepository::class)]
class Document
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    private ?string $nomFichier = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $mimeType = null;

    #[ORM\Column(nullable: true)]
    private ?int $taille = null;

    #[ORM\Column(type: 'datetime_immutable')]
    private ?\DateTimeImmutable $dateAjout = null;

    public function getId(): ?int { return $this->id; }
    public function getNom(): ?string { return $this->nom; }
    public function setNom(string $nom): static { $this->nom = $nom; return $this; }
    public function getNomFichier(): ?string { return $this->nomFichier; }
    public function setNomFichier(string $nomFichier): static { $this->nomFichier = $nomFichier; return $this; }
    public function getMimeType(): ?string { return $this->mimeType; }
    public function setMimeType(?string $mimeType): static { $this->mimeType = $mimeType; return $this; }
    public function getTaille(): ?int { return $this->taille; }
    public function setTaille(?int $taille): static { $this->taille = $taille; return $this; }
    public function getDateAjout(): ?\DateTimeImmutable { return $this->dateAjout; }
    public function setDateAjout(\DateTimeImmutable $dateAjout): static { $this->dateAjout = $dateAjout; return $this; }
}
