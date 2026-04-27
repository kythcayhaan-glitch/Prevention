<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'rqth_document')]
class RqthDocument
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'documents')]
    #[ORM\JoinColumn(nullable: false, onDelete: 'CASCADE')]
    private ?Rqth $rqth = null;

    #[ORM\Column(length: 255)]
    private string $filename = '';

    #[ORM\Column(length: 255)]
    private string $nomOriginal = '';

    public function getId(): ?int { return $this->id; }

    public function getRqth(): ?Rqth { return $this->rqth; }
    public function setRqth(?Rqth $rqth): static { $this->rqth = $rqth; return $this; }

    public function getFilename(): string { return $this->filename; }
    public function setFilename(string $filename): static { $this->filename = $filename; return $this; }

    public function getNomOriginal(): string { return $this->nomOriginal; }
    public function setNomOriginal(string $nomOriginal): static { $this->nomOriginal = $nomOriginal; return $this; }
}
