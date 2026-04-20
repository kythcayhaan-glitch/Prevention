# Bases de données

## celine_symfony.sql
Base de données Symfony avec **toutes les données migrées** (encodage UTF-8 correct).
C'est ce fichier à utiliser pour reprendre le développement.

### Restauration rapide
```bash
mysql -u root -p -e "CREATE DATABASE celine_symfony CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root -p celine_symfony < database/celine_symfony.sql
```

Puis mettre à jour `.env` :
```
DATABASE_URL="mysql://root:@127.0.0.1:3306/celine_symfony?serverVersion=5.0.45&charset=utf8"
```

## celine_original.sql
Base PHP5 originale (encodage latin1/double-encodé). Fournie pour référence.

## Comptes utilisateurs
| Login | Mot de passe | Profil |
|-------|-------------|--------|
| Admin | sopxsopx | Super Admin |
| Jerome | sopxsopx | Admin |
| Celine | louisejeanne | Super Admin |
| Isabelle | calon | Admin |
