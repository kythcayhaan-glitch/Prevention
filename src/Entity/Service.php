<?php

namespace App\Entity;

use App\Repository\ServiceRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ServiceRepository::class)]
#[ORM\Table(name: 'service')]
class Service
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 60)]
    private string $service = '';

    public function getId(): ?int { return $this->id; }

    public function getService(): string { return $this->service; }
    public function setService(string $service): static { $this->service = $service; return $this; }

    public function __toString(): string { return $this->service; }
}
