<?php

namespace App\Entity;

use App\Repository\VisiteRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: VisiteRepository::class)]
#[ORM\Table(name: 'visite')]
class Visite
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $agentVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $poleServiceVisite = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $dateVisite = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $prochaineDateVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $observation = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $rqthVisite = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $restrictionVisite = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $userVisite = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $type = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $recommandationVisite = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $limitationVisite = null;

    #[ORM\Column(length: 3, nullable: true)]
    private ?string $tempsPartielVisite = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt1Du = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt1Au = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt2Du = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt2Au = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt3Du = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt3Au = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt4Du = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $tpt4Au = null;

    #[ORM\Column(nullable: true)]
    private ?int $qte1 = null;

    #[ORM\Column(nullable: true)]
    private ?int $qte2 = null;

    #[ORM\Column(nullable: true)]
    private ?int $qte3 = null;

    #[ORM\Column(nullable: true)]
    private ?int $qte4 = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $emploiVisite = null;

    #[ORM\Column(length: 3, nullable: true)]
    private ?string $tdtOuiNon = null;

    #[ORM\Column(nullable: true)]
    private ?int $travailPencheVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $deboutVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $conduiteVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $utilisationVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $travailHautVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $travailIsoVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $travailBasVisite = null;

    #[ORM\Column(nullable: true)]
    private ?int $effortVisite = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $port = null;

    #[ORM\Column(length: 3, nullable: true)]
    private ?string $epi = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $epiDetail = null;

    public function getId(): ?int { return $this->id; }

    public function getAgentVisite(): ?string { return $this->agentVisite; }
    public function setAgentVisite(?string $agentVisite): static { $this->agentVisite = $agentVisite; return $this; }

    public function getPoleServiceVisite(): ?string { return $this->poleServiceVisite; }
    public function setPoleServiceVisite(?string $poleServiceVisite): static { $this->poleServiceVisite = $poleServiceVisite; return $this; }

    public function getDateVisite(): ?string { return $this->dateVisite; }
    public function setDateVisite(?string $dateVisite): static { $this->dateVisite = $dateVisite; return $this; }

    public function getProchaineDateVisite(): ?string { return $this->prochaineDateVisite; }
    public function setProchaineDateVisite(?string $prochaineDateVisite): static { $this->prochaineDateVisite = $prochaineDateVisite; return $this; }

    public function getNombreDates(): int
    {
        return ($this->dateVisite ? 1 : 0) + ($this->prochaineDateVisite ? 1 : 0);
    }

    public function getObservation(): ?string { return $this->observation; }
    public function setObservation(?string $observation): static { $this->observation = $observation; return $this; }

    public function getRqthVisite(): ?string { return $this->rqthVisite; }
    public function setRqthVisite(?string $rqthVisite): static { $this->rqthVisite = $rqthVisite; return $this; }

    public function getRestrictionVisite(): ?string { return $this->restrictionVisite; }
    public function setRestrictionVisite(?string $restrictionVisite): static { $this->restrictionVisite = $restrictionVisite; return $this; }

    public function getUserVisite(): ?string { return $this->userVisite; }
    public function setUserVisite(?string $userVisite): static { $this->userVisite = $userVisite; return $this; }

    public function getType(): ?string { return $this->type; }
    public function setType(?string $type): static { $this->type = $type; return $this; }

    public function getRecommandationVisite(): ?string { return $this->recommandationVisite; }
    public function setRecommandationVisite(?string $recommandationVisite): static { $this->recommandationVisite = $recommandationVisite; return $this; }

    public function getLimitationVisite(): ?string { return $this->limitationVisite; }
    public function setLimitationVisite(?string $limitationVisite): static { $this->limitationVisite = $limitationVisite; return $this; }

    public function getTempsPartielVisite(): ?string { return $this->tempsPartielVisite; }
    public function setTempsPartielVisite(?string $tempsPartielVisite): static { $this->tempsPartielVisite = $tempsPartielVisite; return $this; }

    public function getTpt1Du(): ?string { return $this->tpt1Du; }
    public function setTpt1Du(?string $tpt1Du): static { $this->tpt1Du = $tpt1Du; return $this; }

    public function getTpt1Au(): ?string { return $this->tpt1Au; }
    public function setTpt1Au(?string $tpt1Au): static { $this->tpt1Au = $tpt1Au; return $this; }

    public function getTpt2Du(): ?string { return $this->tpt2Du; }
    public function setTpt2Du(?string $tpt2Du): static { $this->tpt2Du = $tpt2Du; return $this; }

    public function getTpt2Au(): ?string { return $this->tpt2Au; }
    public function setTpt2Au(?string $tpt2Au): static { $this->tpt2Au = $tpt2Au; return $this; }

    public function getTpt3Du(): ?string { return $this->tpt3Du; }
    public function setTpt3Du(?string $tpt3Du): static { $this->tpt3Du = $tpt3Du; return $this; }

    public function getTpt3Au(): ?string { return $this->tpt3Au; }
    public function setTpt3Au(?string $tpt3Au): static { $this->tpt3Au = $tpt3Au; return $this; }

    public function getTpt4Du(): ?string { return $this->tpt4Du; }
    public function setTpt4Du(?string $tpt4Du): static { $this->tpt4Du = $tpt4Du; return $this; }

    public function getTpt4Au(): ?string { return $this->tpt4Au; }
    public function setTpt4Au(?string $tpt4Au): static { $this->tpt4Au = $tpt4Au; return $this; }

    public function getQte1(): ?int { return $this->qte1; }
    public function setQte1(?int $qte1): static { $this->qte1 = $qte1; return $this; }

    public function getQte2(): ?int { return $this->qte2; }
    public function setQte2(?int $qte2): static { $this->qte2 = $qte2; return $this; }

    public function getQte3(): ?int { return $this->qte3; }
    public function setQte3(?int $qte3): static { $this->qte3 = $qte3; return $this; }

    public function getQte4(): ?int { return $this->qte4; }
    public function setQte4(?int $qte4): static { $this->qte4 = $qte4; return $this; }

    public function getEmploiVisite(): ?string { return $this->emploiVisite; }
    public function setEmploiVisite(?string $emploiVisite): static { $this->emploiVisite = $emploiVisite; return $this; }

    public function getTdtOuiNon(): ?string { return $this->tdtOuiNon; }
    public function setTdtOuiNon(?string $tdtOuiNon): static { $this->tdtOuiNon = $tdtOuiNon; return $this; }

    public function getTravailPencheVisite(): ?int { return $this->travailPencheVisite; }
    public function setTravailPencheVisite(?int $travailPencheVisite): static { $this->travailPencheVisite = $travailPencheVisite; return $this; }

    public function getDeboutVisite(): ?int { return $this->deboutVisite; }
    public function setDeboutVisite(?int $deboutVisite): static { $this->deboutVisite = $deboutVisite; return $this; }

    public function getConduiteVisite(): ?int { return $this->conduiteVisite; }
    public function setConduiteVisite(?int $conduiteVisite): static { $this->conduiteVisite = $conduiteVisite; return $this; }

    public function getUtilisationVisite(): ?int { return $this->utilisationVisite; }
    public function setUtilisationVisite(?int $utilisationVisite): static { $this->utilisationVisite = $utilisationVisite; return $this; }

    public function getTravailHautVisite(): ?int { return $this->travailHautVisite; }
    public function setTravailHautVisite(?int $travailHautVisite): static { $this->travailHautVisite = $travailHautVisite; return $this; }

    public function getTravailIsoVisite(): ?int { return $this->travailIsoVisite; }
    public function setTravailIsoVisite(?int $travailIsoVisite): static { $this->travailIsoVisite = $travailIsoVisite; return $this; }

    public function getTravailBasVisite(): ?int { return $this->travailBasVisite; }
    public function setTravailBasVisite(?int $travailBasVisite): static { $this->travailBasVisite = $travailBasVisite; return $this; }

    public function getEffortVisite(): ?int { return $this->effortVisite; }
    public function setEffortVisite(?int $effortVisite): static { $this->effortVisite = $effortVisite; return $this; }

    public function getPort(): ?string { return $this->port; }
    public function setPort(?string $port): static { $this->port = $port; return $this; }

    public function getEpi(): ?string { return $this->epi; }
    public function setEpi(?string $epi): static { $this->epi = $epi; return $this; }

    public function getEpiDetail(): ?string { return $this->epiDetail; }
    public function setEpiDetail(?string $epiDetail): static { $this->epiDetail = $epiDetail; return $this; }
}
