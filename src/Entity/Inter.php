<?php

namespace App\Entity;

use App\Repository\InterRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InterRepository::class)]
#[ORM\Table(name: 'inter')]
class Inter
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

    #[ORM\Column(length: 255, nullable: true)]
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
    private ?string $agentVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $agentRqth = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $poleServiceVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $poleServiceRqth = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $dateVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $observation = null;

    #[ORM\Column(length: 3, nullable: true)]
    private ?string $rqthVisite = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $restrictionVisite = null;

    #[ORM\Column(length: 60, nullable: true)]
    private ?string $userInter = null;

    #[ORM\Column(length: 5, nullable: true)]
    private ?string $urgence = null;

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

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $emploiVisite = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $emploiRqth = null;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $prix1 = null;

    #[ORM\Column(length: 1000, nullable: true)]
    private ?string $etatRqth = null;

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

    public function getAgentVisite(): ?string { return $this->agentVisite; }
    public function setAgentVisite(?string $agentVisite): static { $this->agentVisite = $agentVisite; return $this; }

    public function getAgentRqth(): ?string { return $this->agentRqth; }
    public function setAgentRqth(?string $agentRqth): static { $this->agentRqth = $agentRqth; return $this; }

    public function getPoleServiceVisite(): ?string { return $this->poleServiceVisite; }
    public function setPoleServiceVisite(?string $poleServiceVisite): static { $this->poleServiceVisite = $poleServiceVisite; return $this; }

    public function getPoleServiceRqth(): ?string { return $this->poleServiceRqth; }
    public function setPoleServiceRqth(?string $poleServiceRqth): static { $this->poleServiceRqth = $poleServiceRqth; return $this; }

    public function getDateVisite(): ?string { return $this->dateVisite; }
    public function setDateVisite(?string $dateVisite): static { $this->dateVisite = $dateVisite; return $this; }

    public function getObservation(): ?string { return $this->observation; }
    public function setObservation(?string $observation): static { $this->observation = $observation; return $this; }

    public function getRqthVisite(): ?string { return $this->rqthVisite; }
    public function setRqthVisite(?string $rqthVisite): static { $this->rqthVisite = $rqthVisite; return $this; }

    public function getRestrictionVisite(): ?string { return $this->restrictionVisite; }
    public function setRestrictionVisite(?string $restrictionVisite): static { $this->restrictionVisite = $restrictionVisite; return $this; }

    public function getUserInter(): ?string { return $this->userInter; }
    public function setUserInter(?string $userInter): static { $this->userInter = $userInter; return $this; }

    public function getUrgence(): ?string { return $this->urgence; }
    public function setUrgence(?string $urgence): static { $this->urgence = $urgence; return $this; }

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

    public function getEmploiVisite(): ?string { return $this->emploiVisite; }
    public function setEmploiVisite(?string $emploiVisite): static { $this->emploiVisite = $emploiVisite; return $this; }

    public function getEmploiRqth(): ?string { return $this->emploiRqth; }
    public function setEmploiRqth(?string $emploiRqth): static { $this->emploiRqth = $emploiRqth; return $this; }

    public function getPrix1(): ?string { return $this->prix1; }
    public function setPrix1(?string $prix1): static { $this->prix1 = $prix1; return $this; }

    public function getEtatRqth(): ?string { return $this->etatRqth; }
    public function setEtatRqth(?string $etatRqth): static { $this->etatRqth = $etatRqth; return $this; }

    public function getTauxTotal(): ?string { return $this->tauxTotal; }
    public function setTauxTotal(?string $tauxTotal): static { $this->tauxTotal = $tauxTotal; return $this; }

    public function getPar(): ?string { return $this->par; }
    public function setPar(?string $par): static { $this->par = $par; return $this; }
}
