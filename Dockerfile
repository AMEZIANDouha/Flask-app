# Étape 1 : Utiliser une image de base
FROM python:3.9-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier les dépendances dans le conteneur
COPY requirements.txt requirements.txt

# Étape 4 : Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Copier le code de l'application dans le conteneur
COPY . .

# Étape 6 : Exposer le port que l'application utilise
EXPOSE 5000

# Étape 7 : Définir la commande de démarrage par défaut
CMD ["python", "app.py"]
