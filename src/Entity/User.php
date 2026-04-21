<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 60)]
    private string $login = '';

    #[ORM\Column(length: 255)]
    private string $password = '';

    #[ORM\Column]
    private int $idProfil = 0;

    #[ORM\Column(length: 60)]
    private string $nom = '';

    #[ORM\Column(length: 60)]
    private string $service = '';

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $theme = null;

    public function getId(): ?int { return $this->id; }

    public function getLogin(): string { return $this->login; }
    public function setLogin(string $login): static { $this->login = $login; return $this; }

    public function getPassword(): string { return $this->password; }
    public function setPassword(string $password): static { $this->password = $password; return $this; }

    public function getIdProfil(): int { return $this->idProfil; }
    public function setIdProfil(int $idProfil): static { $this->idProfil = $idProfil; return $this; }

    public function getNom(): string { return $this->nom; }
    public function setNom(string $nom): static { $this->nom = $nom; return $this; }

    public function getService(): string { return $this->service; }
    public function setService(string $service): static { $this->service = $service; return $this; }

    public function getTheme(): ?string { return $this->theme; }
    public function setTheme(?string $theme): static { $this->theme = $theme; return $this; }

    public function getUserIdentifier(): string { return $this->nom; }

    public function getRoles(): array
    {
        return match ($this->idProfil) {
            2 => ['ROLE_SUPER_ADMIN', 'ROLE_ADMIN', 'ROLE_USER'],
            1 => ['ROLE_ADMIN', 'ROLE_USER'],
            default => ['ROLE_USER'],
        };
    }

    public function eraseCredentials(): void {}
}
