<?php

namespace App\Entity;

use App\Repository\InterOkRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InterOkRepository::class)]
#[ORM\Table(name: 'inter_ok')]
class InterOk
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $date = null;

    #[ORM\Column(nullable: true)]
    private ?int $heure = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $service = null;

    #[ORM\Column(type: 'text', nullable: true)]
    private ?string $panneAnnonce = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $coutMatos = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $interEffect = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $duree = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $intervenant = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxIntervenant = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $intervenant2 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxIntervenant2 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $intervenant3 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxIntervenant3 = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $intervenant4 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxIntervenant4 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $intervenant5 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxIntervenant5 = null;

    #[ORM\Column(nullable: true)]
    private ?int $coutIntervention = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $observation = null;

    #[ORM\Column(type: 'date', nullable: true)]
    private ?\DateTimeInterface $dateEnregistrer = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $dateTerminer = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $userInter = null;

    #[ORM\Column(length: 5, nullable: true)]
    private ?string $urgence = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $type = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $matos1 = null;

    #[ORM\Column(nullable: true)]
    private ?int $quantite1 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix1 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $matos2 = null;

    #[ORM\Column(nullable: true)]
    private ?int $quantite2 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix2 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $matos3 = null;

    #[ORM\Column(nullable: true)]
    private ?int $quantite3 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix3 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $matos4 = null;

    #[ORM\Column(nullable: true)]
    private ?int $quantite4 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix4 = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $matos5 = null;

    #[ORM\Column(nullable: true)]
    private ?int $quantite5 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix5 = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $tauxTotal = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $par = null;

    public function getId(): ?int { return $this->id; }

    public function getDate(): ?string { return $this->date; }
    public function setDate(?string $date): static { $this->date = $date; return $this; }

    public function getHeure(): ?int { return $this->heure; }
    public function setHeure(?int $heure): static { $this->heure = $heure; return $this; }

    public function getService(): ?string { return $this->service; }
    public function setService(?string $service): static { $this->service = $service; return $this; }

    public function getPanneAnnonce(): ?string { return $this->panneAnnonce; }
    public function setPanneAnnonce(?string $panneAnnonce): static { $this->panneAnnonce = $panneAnnonce; return $this; }

    public function getCoutMatos(): ?string { return $this->coutMatos; }
    public function setCoutMatos(?string $coutMatos): static { $this->coutMatos = $coutMatos; return $this; }

    public function getInterEffect(): ?string { return $this->interEffect; }
    public function setInterEffect(?string $interEffect): static { $this->interEffect = $interEffect; return $this; }

    public function getDuree(): ?string { return $this->duree; }
    public function setDuree(?string $duree): static { $this->duree = $duree; return $this; }

    public function getIntervenant(): ?string { return $this->intervenant; }
    public function setIntervenant(?string $intervenant): static { $this->intervenant = $intervenant; return $this; }

    public function getTauxIntervenant(): ?string { return $this->tauxIntervenant; }
    public function setTauxIntervenant(?string $tauxIntervenant): static { $this->tauxIntervenant = $tauxIntervenant; return $this; }

    public function getIntervenant2(): ?string { return $this->intervenant2; }
    public function setIntervenant2(?string $intervenant2): static { $this->intervenant2 = $intervenant2; return $this; }

    public function getTauxIntervenant2(): ?string { return $this->tauxIntervenant2; }
    public function setTauxIntervenant2(?string $tauxIntervenant2): static { $this->tauxIntervenant2 = $tauxIntervenant2; return $this; }

    public function getIntervenant3(): ?string { return $this->intervenant3; }
    public function setIntervenant3(?string $intervenant3): static { $this->intervenant3 = $intervenant3; return $this; }

    public function getTauxIntervenant3(): ?string { return $this->tauxIntervenant3; }
    public function setTauxIntervenant3(?string $tauxIntervenant3): static { $this->tauxIntervenant3 = $tauxIntervenant3; return $this; }

    public function getIntervenant4(): ?string { return $this->intervenant4; }
    public function setIntervenant4(?string $intervenant4): static { $this->intervenant4 = $intervenant4; return $this; }

    public function getTauxIntervenant4(): ?string { return $this->tauxIntervenant4; }
    public function setTauxIntervenant4(?string $tauxIntervenant4): static { $this->tauxIntervenant4 = $tauxIntervenant4; return $this; }

    public function getIntervenant5(): ?string { return $this->intervenant5; }
    public function setIntervenant5(?string $intervenant5): static { $this->intervenant5 = $intervenant5; return $this; }

    public function getTauxIntervenant5(): ?string { return $this->tauxIntervenant5; }
    public function setTauxIntervenant5(?string $tauxIntervenant5): static { $this->tauxIntervenant5 = $tauxIntervenant5; return $this; }

    public function getCoutIntervention(): ?int { return $this->coutIntervention; }
    public function setCoutIntervention(?int $coutIntervention): static { $this->coutIntervention = $coutIntervention; return $this; }

    public function getObservation(): ?string { return $this->observation; }
    public function setObservation(?string $observation): static { $this->observation = $observation; return $this; }

    public function getDateEnregistrer(): ?\DateTimeInterface { return $this->dateEnregistrer; }
    public function setDateEnregistrer(?\DateTimeInterface $dateEnregistrer): static { $this->dateEnregistrer = $dateEnregistrer; return $this; }

    public function getDateTerminer(): ?string { return $this->dateTerminer; }
    public function setDateTerminer(?string $dateTerminer): static { $this->dateTerminer = $dateTerminer; return $this; }

    public function getUserInter(): ?string { return $this->userInter; }
    public function setUserInter(?string $userInter): static { $this->userInter = $userInter; return $this; }

    public function getUrgence(): ?string { return $this->urgence; }
    public function setUrgence(?string $urgence): static { $this->urgence = $urgence; return $this; }

    public function getType(): ?string { return $this->type; }
    public function setType(?string $type): static { $this->type = $type; return $this; }

    public function getMatos1(): ?string { return $this->matos1; }
    public function setMatos1(?string $matos1): static { $this->matos1 = $matos1; return $this; }

    public function getQuantite1(): ?int { return $this->quantite1; }
    public function setQuantite1(?int $quantite1): static { $this->quantite1 = $quantite1; return $this; }

    public function getPrix1(): ?string { return $this->prix1; }
    public function setPrix1(?string $prix1): static { $this->prix1 = $prix1; return $this; }

    public function getMatos2(): ?string { return $this->matos2; }
    public function setMatos2(?string $matos2): static { $this->matos2 = $matos2; return $this; }

    public function getQuantite2(): ?int { return $this->quantite2; }
    public function setQuantite2(?int $quantite2): static { $this->quantite2 = $quantite2; return $this; }

    public function getPrix2(): ?string { return $this->prix2; }
    public function setPrix2(?string $prix2): static { $this->prix2 = $prix2; return $this; }

    public function getMatos3(): ?string { return $this->matos3; }
    public function setMatos3(?string $matos3): static { $this->matos3 = $matos3; return $this; }

    public function getQuantite3(): ?int { return $this->quantite3; }
    public function setQuantite3(?int $quantite3): static { $this->quantite3 = $quantite3; return $this; }

    public function getPrix3(): ?string { return $this->prix3; }
    public function setPrix3(?string $prix3): static { $this->prix3 = $prix3; return $this; }

    public function getMatos4(): ?string { return $this->matos4; }
    public function setMatos4(?string $matos4): static { $this->matos4 = $matos4; return $this; }

    public function getQuantite4(): ?int { return $this->quantite4; }
    public function setQuantite4(?int $quantite4): static { $this->quantite4 = $quantite4; return $this; }

    public function getPrix4(): ?string { return $this->prix4; }
    public function setPrix4(?string $prix4): static { $this->prix4 = $prix4; return $this; }

    public function getMatos5(): ?string { return $this->matos5; }
    public function setMatos5(?string $matos5): static { $this->matos5 = $matos5; return $this; }

    public function getQuantite5(): ?int { return $this->quantite5; }
    public function setQuantite5(?int $quantite5): static { $this->quantite5 = $quantite5; return $this; }

    public function getPrix5(): ?string { return $this->prix5; }
    public function setPrix5(?string $prix5): static { $this->prix5 = $prix5; return $this; }

    public function getTauxTotal(): ?string { return $this->tauxTotal; }
    public function setTauxTotal(?string $tauxTotal): static { $this->tauxTotal = $tauxTotal; return $this; }

    public function getPar(): ?string { return $this->par; }
    public function setPar(?string $par): static { $this->par = $par; return $this; }
}
