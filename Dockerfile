# Utiliser l'image de base Python
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier requirements.txt si tu en as, sinon ignorer cette étape
#COPY requirements.txt ./

# Installer les dépendances
#RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application dans le conteneur
COPY . .

# Exposer le port 5000
EXPOSE 5000

# Commande par défaut
CMD ["python", "-m", "http.server", "5000"]
