# Clone partiel de l'application EasyTransfert dans le cadre du test pour le poste Mobile Developer

## Installation

1. **Cloner le projet**

    ```bash
    git clone https://github.com/SaoureT13/Kaybic-Africa-mobile-developer-project.git
    cd mobile
    ```

2. **Installer les dépendances**

    ```bash
    flutter pub get
    ```

3. **Vérifier l'installation Flutter**

    ```bash
    flutter doctor
    ```

4. **Lancer l'application**
    ```bash
    flutter run
    ```

## Connexion à l'application

Pour accéder à l'application en mode développement, utilisez les identifiants suivants :

-   **Numéro de téléphone** : `0000000000`
-   **Mot de passe** : `password`

## Structure du projet

```
lib/
├── core/               # Fonctionnalités communes (router, utils, etc.)
├── features/           # Fonctionnalités métier
│   ├── auth/          # Authentification
│   └── transactions/  # Gestion des transactions
└── main.dart          # Point d'entrée de l'application
└── app.dart          # Initialisation de l'application

```

## Packages utilisées

-   **Intl** - Gestion des traductions et du formattage des dates(en/fr)
-   **Go Router** - Navigation
