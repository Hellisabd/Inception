#!/bin/bash

# Démarrer le serveur MariaDB
/etc/init.d/mariadb start

# Attendre que le serveur soit prêt
for i in {1..30}; do
    if mysqladmin ping --silent; then
        break
    fi
    echo "En attente que le serveur MariaDB soit prêt..."
    sleep 1
done

# Vérifier si le serveur est opérationnel après 30 secondes
if ! mysqladmin ping --silent; then
    echo "Erreur : Le serveur MariaDB n'est pas opérationnel."
    exit 1
fi

# Créer la base de données
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

# Créer l'utilisateur
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Accorder les privilèges
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"

# Actualiser les privilèges
mysql -e "FLUSH PRIVILEGES;"

# Arrêter le serveur
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Lancer mysqld_safe pour garder le conteneur actif
exec mysqld_safe
