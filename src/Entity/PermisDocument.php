<?php

namespace App\Entity;

use App\Repository\PermisDocumentRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PermisDocumentRepository::class)]
#[ORM\Table(name: 'permis_document')]
class PermisDocument
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private string $nom = '';

    #[ORM\Column(length: 255)]
    private string $nomFichier = '';

    #[ORM\Column(nullable: true)]
    private ?int $taille = null;

    #[ORM\Column(type: 'datetime_immutable')]
    private \DateTimeImmutable $dateAjout;

    #[ORM\ManyToOne(targetEntity: Permis::class, inversedBy: 'agentDocuments')]
    #[ORM\JoinColumn(nullable: true, onDelete: 'CASCADE')]
    private ?Permis $permis = null;

    public function __construct()
    {
        $this->dateAjout = new \DateTimeImmutable();
    }

    public function getId(): ?int { return $this->id; }

    public function getNom(): string { return $this->nom; }
    public function setNom(string $nom): static { $this->nom = $nom; return $this; }

    public function getNomFichier(): string { return $this->nomFichier; }
    public function setNomFichier(string $nomFichier): static { $this->nomFichier = $nomFichier; return $this; }

    public function getTaille(): ?int { return $this->taille; }
    public function setTaille(?int $taille): static { $this->taille = $taille; return $this; }

    public function getDateAjout(): \DateTimeImmutable { return $this->dateAjout; }

    public function getPermis(): ?Permis { return $this->permis; }
    public function setPermis(?Permis $permis): static { $this->permis = $permis; return $this; }
}
