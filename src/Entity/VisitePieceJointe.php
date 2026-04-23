<?php

namespace App\Entity;

use App\Repository\VisitePieceJointeRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: VisitePieceJointeRepository::class)]
#[ORM\Table(name: 'visite_piece_jointe')]
class VisitePieceJointe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(targetEntity: Visite::class, inversedBy: 'piecesJointes')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Visite $visite = null;

    #[ORM\Column(length: 255)]
    private string $nom = '';

    #[ORM\Column(length: 255)]
    private string $nomFichier = '';

    #[ORM\Column(nullable: true)]
    private ?int $taille = null;

    #[ORM\Column]
    private \DateTimeImmutable $dateAjout;

    public function __construct()
    {
        $this->dateAjout = new \DateTimeImmutable();
    }

    public function getId(): ?int { return $this->id; }

    public function getVisite(): ?Visite { return $this->visite; }
    public function setVisite(?Visite $visite): static { $this->visite = $visite; return $this; }

    public function getNom(): string { return $this->nom; }
    public function setNom(string $nom): static { $this->nom = $nom; return $this; }

    public function getNomFichier(): string { return $this->nomFichier; }
    public function setNomFichier(string $nomFichier): static { $this->nomFichier = $nomFichier; return $this; }

    public function getTaille(): ?int { return $this->taille; }
    public function setTaille(?int $taille): static { $this->taille = $taille; return $this; }

    public function getDateAjout(): \DateTimeImmutable { return $this->dateAjout; }
    public function setDateAjout(\DateTimeImmutable $dateAjout): static { $this->dateAjout = $dateAjout; return $this; }

    public function getExtension(): string
    {
        return strtolower(pathinfo($this->nomFichier, PATHINFO_EXTENSION));
    }
}
