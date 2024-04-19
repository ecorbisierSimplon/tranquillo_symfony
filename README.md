# INSTALLATION DE TRANQUILLO©

## BASE DE DONNÉES

Enregistrer vos fichier sql dans database/sql
La base de donnée est sauvegarder en locale dans database/tranquillo_sql mais n'est pas incluse dans le dépot git.

<!-- TOC -->

- [INSTALLATION DE TRANQUILLO©](#installation-de-tranquillo%C2%A9)
  - [BASE DE DONNÉES](#base-de-donn%C3%A9es)
    - [Projet inital](#projet-inital)
    - [Initialsation du projet](#initialsation-du-projet)
    - [Création 1ère page](#cr%C3%A9ation-1%C3%A8re-page)
      - [COMMANDES UTILES](#commandes-utiles)
        - [Ajout d'un controller](#ajout-dun-controller)
        - [Ajout d'une entitée](#ajout-dune-entit%C3%A9e)
        - [Création de la database](#cr%C3%A9ation-de-la-database)
        - [Enregistrer les entitées](#enregistrer-les-entit%C3%A9es)
        - [Ajouter la gestions des utilisateurs](#ajouter-la-gestions-des-utilisateurs)
        - [Générer les crud](#g%C3%A9n%C3%A9rer-les-crud)
        - [Lister les routes](#lister-les-routes)
  - [FRONTEND](#frontend)

<!-- /TOC -->

### Projet inital

[projet de Dunglas symfony-docker github](https://github.com/dunglas/symfony-docker/)

---

### Initialsation du projet

Avec le terminal, excuter les commande suivantes à la racine de "tranquillo©":

**Pour la 1ère installation, exécutez :**

```bash
chmod +x ./install.sh && ./install.sh
```

**Pour les mise à jour ou reconstruction utilisez back.sh**
_Vous pouvez effacer le dossier de la base de donnée_
_(cela ne supprime pas le dossier sql)_

```bash
chmod +x ./back.sh && ./back.sh
```

Une fois l'installation terminée, [vous pouvez lancer symfony avec http://localhost:8088 en cliquant sur ce lien.](http://localhost:8088)

**`<span style="color:red">`N'utilisez pas les liens Docker pour symfony `<br>`(un paramètre fausse les liens dans docker).**

---

### Création 1ère page

[Tuto symfony](https://symfony.com/doc/current/page_creation.html)

---

#### COMMANDES UTILES

##### Ajout d'un controller

```bash
php bin/console make:controller
```

> donner lui un nom de type <name>Controller
> Remplacer `<name>` par le nom de votre controller

---

##### Ajout d'une entitée

```bash
php bin/console make:entity
```

> donner lui un nom de type <name>
> Remplacer `<name>` par le nom de votre entité

---

##### Création de la database

```bash
php bin/console doctrine:database:create
```

> _LA DATABASE N'EST PAS ENCORE ENREGISTRÉES DANS LA BDD_
> Elle sera générée lors de la 1ère éxecution de migrate

---

##### Enregistrer les entitées

```bash
php bin/console make:migration
```

> _Un fichier est généré dans le dossiers migrations_

```bash
php bin/console doctrine:migration:migrate
```

> _Envoie de toutes le créations et modifications liées au entitée (tables) à la base de données_

---

##### Ajouter la gestions des utilisateurs

```bash
php bin/console make:user
```

```bash
php bin/console make:auth
```

---

##### Générer les crud

```bash
php bin/console make:crud
```

> _Génère les crud POST et GET._
> A adapter pour le fetch

---

##### Lister les routes

```bash
php bin/console debug:router
```

## FRONTEND
