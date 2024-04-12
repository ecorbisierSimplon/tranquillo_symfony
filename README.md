# INSTALLATION DE TRANQUILLO©

## BASE DE DONNÉES

Enregistrer vos fichier sql dans database/sql
La base de donnée est sauvegarder en locale dans database/tranquillo_sql mais n'est pas incluse dans le dépot git.

<!-- TOC -->

- [INSTALLATION DE TRANQUILLO©](#installation-de-tranquillo)
  - [BASE DE DONNÉES](#base-de-données)
    - [Projet inital](#projet-inital)
    - [Initialsation du projet](#initialsation-du-projet)
    - [Création 1ère page](#création-1ère-page)
      - [COMMANDES UTILES](#commandes-utiles)
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

Une fois l'installation terminée, [vous pouvez lancer symfony avec https://localhost:443 en cliquant sur ce lien.](https://localhost:443)

**<span style="color:red">N'utilisez pas les liens Docker pour symfony <br>(un paramètre fausse les liens dans docker).</span>**

---

### Création 1ère page

[Tuto symfony](https://symfony.com/doc/current/page_creation.html)

---

#### COMMANDES UTILES

- **Ajout d'un controller :**

Remplacer <name> par le nom de votre controller

```bash
php bin/console make:controller <name>Controller
```

---

- **Lister les routes :**

```bash
php bin/console debug:router
```

## FRONTEND
