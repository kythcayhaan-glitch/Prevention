# Installation de CELINE Symfony

## Prérequis
- PHP 8.2+ (disponible dans E:\++++prog\php\)
- MySQL 5.5+ ou MariaDB
- Composer (disponible dans E:\++++prog\php\)

## Étapes d'installation

### 1. Configurer la base de données
Modifiez le fichier `.env` si nécessaire :
```
DATABASE_URL="mysql://UTILISATEUR:MOT_DE_PASSE@127.0.0.1:3306/celine_symfony?serverVersion=5.5.54&charset=utf8mb4"
```

### 2. Créer la base de données
```bash
php bin/console doctrine:database:create
```

### 3. Exécuter les migrations (crée les tables)
```bash
php bin/console doctrine:migrations:migrate --no-interaction
```

### 4. Importer les données depuis l'ancienne base MySQL CELINE
Assurez-vous que l'ancienne base `celine` est accessible, puis :
```bash
php bin/console app:import-data
```
**Note :** Les mots de passe des utilisateurs seront hachés en bcrypt (sécurisé).
Les anciens mots de passe en clair (sopxsopx, louisejeanne, calon) seront préservés mais hashés.

### 5. OU : Importer depuis le fichier celine.sql
Si vous avez uniquement le fichier SQL :
1. Créez une base MySQL temporaire nommée `celine`
2. Importez celine.sql dedans : `mysql -u root -p celine < celine.sql`
3. Puis lancez la commande d'import ci-dessus

### 6. Démarrer le serveur de développement
Avec le CLI Symfony :
```bash
symfony serve
```
Ou avec PHP natif :
```bash
php -S localhost:8000 -t public/
```

### 7. Se connecter
Ouvrez `http://localhost:8000`

**Comptes disponibles après import :**
| Login | Mot de passe | Profil |
|-------|-------------|--------|
| Admin | sopxsopx | Super Admin |
| Jerome | sopxsopx | Admin |
| Celine | louisejeanne | Super Admin |
| Isabelle | calon | Admin |

## Structure du projet
```
src/
  Controller/    - Controllers Symfony (CRUD pour chaque module)
  Entity/        - Entités Doctrine (User, Visite, Rqth, Fiphfp, Inter, ...)
  Form/          - Formulaires Symfony
  Repository/    - Repositories Doctrine
  Command/       - Commande d'import des données
migrations/      - Migrations SQL Doctrine
templates/       - Vues Twig + Bootstrap 5
```

## Modules disponibles
- **Tableau de bord** : Statistiques générales
- **Visites de prévention** : Suivi des visites, restrictions, EPI, TPT
- **RQTH** : Gestion des dossiers travailleurs handicapés
- **FIPHFP** : Suivi des demandes de financement
- **Interventions** : Gestion des interventions et visites
- **Bâtiments** : Liste des bâtiments (Admin)
- **Services** : Liste des services (Admin)
- **Intervenants** : Gestion du personnel (Admin)
- **Stock** : Gestion du stock EPI (Admin)
- **Utilisateurs** : Gestion des comptes (Super Admin)

## Sécurité améliorée vs PHP5
- Mots de passe hashés en bcrypt (vs plaintext avant)
- Protection CSRF sur tous les formulaires
- Contrôle d'accès par rôles (ROLE_USER / ROLE_ADMIN / ROLE_SUPER_ADMIN)
- Requêtes préparées via Doctrine ORM (vs injection SQL avant)
- Sessions sécurisées Symfony
