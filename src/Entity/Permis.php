<?php

namespace App\Entity;

use App\Repository\PermisRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PermisRepository::class)]
#[ORM\Table(name: 'permis')]
class Permis
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $genre = null;

    #[ORM\Column(length: 100)]
    private ?string $nom = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $prenom = null;

    // Permis C
    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisCObtention = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisCValidite = null;

    // Permis D
    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisDObtention = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisDValidite = null;

    // Permis E
    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisEObtention = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $permisEValidite = null;

    // FIMO
    #[ORM\Column(length: 20, nullable: true)]
    private ?string $fimoType = null;

    #[ORM\Column(length: 7, nullable: true)]
    private ?string $fimoObtention = null;

    #[ORM\Column(length: 7, nullable: true)]
    private ?string $fimoProchaine = null;

    // FCO
    #[ORM\Column(length: 7, nullable: true)]
    private ?string $fcoObtention = null;

    #[ORM\Column(length: 7, nullable: true)]
    private ?string $fcoProchaine = null;

    // Visite médicale
    #[ORM\Column(length: 7, nullable: true)]
    private ?string $visiteMedicaleRealisee = null;

    #[ORM\Column(length: 7, nullable: true)]
    private ?string $visiteMedicaleProchaine = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $notes = null;

    #[ORM\OneToMany(targetEntity: PermisDocument::class, mappedBy: 'permis', cascade: ['remove'], orphanRemoval: true)]
    private Collection $agentDocuments;

    public function __construct()
    {
        $this->agentDocuments = new ArrayCollection();
    }

    public function getId(): ?int { return $this->id; }

    public function getGenre(): ?string { return $this->genre; }
    public function setGenre(?string $genre): static { $this->genre = $genre; return $this; }

    public function getNom(): ?string { return $this->nom; }
    public function setNom(?string $nom): static { $this->nom = $nom ? strtoupper($nom) : $nom; return $this; }

    public function getPrenom(): ?string { return $this->prenom; }
    public function setPrenom(?string $prenom): static { $this->prenom = $prenom; return $this; }

    public function getNomComplet(): string { return trim($this->nom . ' ' . $this->prenom); }

    public function getPermisCObtention(): ?string { return $this->permisCObtention; }
    public function setPermisCObtention(?string $v): static { $this->permisCObtention = $v; return $this; }

    public function getPermisCValidite(): ?string { return $this->permisCValidite; }
    public function setPermisCValidite(?string $v): static { $this->permisCValidite = $v; return $this; }

    public function getPermisDObtention(): ?string { return $this->permisDObtention; }
    public function setPermisDObtention(?string $v): static { $this->permisDObtention = $v; return $this; }

    public function getPermisDValidite(): ?string { return $this->permisDValidite; }
    public function setPermisDValidite(?string $v): static { $this->permisDValidite = $v; return $this; }

    public function getPermisEObtention(): ?string { return $this->permisEObtention; }
    public function setPermisEObtention(?string $v): static { $this->permisEObtention = $v; return $this; }

    public function getPermisEValidite(): ?string { return $this->permisEValidite; }
    public function setPermisEValidite(?string $v): static { $this->permisEValidite = $v; return $this; }

    public function getFimoType(): ?string { return $this->fimoType; }
    public function setFimoType(?string $v): static { $this->fimoType = $v; return $this; }

    public function getFimoObtention(): ?string { return $this->fimoObtention; }
    public function setFimoObtention(?string $v): static { $this->fimoObtention = $v; return $this; }

    public function getFimoProchaine(): ?string { return $this->fimoProchaine; }
    public function setFimoProchaine(?string $v): static { $this->fimoProchaine = $v; return $this; }

    public function getFcoObtention(): ?string { return $this->fcoObtention; }
    public function setFcoObtention(?string $v): static { $this->fcoObtention = $v; return $this; }

    public function getFcoProchaine(): ?string { return $this->fcoProchaine; }
    public function setFcoProchaine(?string $v): static { $this->fcoProchaine = $v; return $this; }

    public function getVisiteMedicaleRealisee(): ?string { return $this->visiteMedicaleRealisee; }
    public function setVisiteMedicaleRealisee(?string $v): static { $this->visiteMedicaleRealisee = $v; return $this; }

    public function getVisiteMedicaleProchaine(): ?string { return $this->visiteMedicaleProchaine; }
    public function setVisiteMedicaleProchaine(?string $v): static { $this->visiteMedicaleProchaine = $v; return $this; }

    public function getNotes(): ?string { return $this->notes; }
    public function setNotes(?string $v): static { $this->notes = $v; return $this; }

    public function getAgentDocuments(): Collection { return $this->agentDocuments; }

    public function addAgentDocument(PermisDocument $doc): static
    {
        if (!$this->agentDocuments->contains($doc)) {
            $this->agentDocuments->add($doc);
            $doc->setPermis($this);
        }
        return $this;
    }

    public function removeAgentDocument(PermisDocument $doc): static
    {
        if ($this->agentDocuments->removeElement($doc) && $doc->getPermis() === $this) {
            $doc->setPermis(null);
        }
        return $this;
    }
}
