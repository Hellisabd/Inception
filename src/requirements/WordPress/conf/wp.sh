#!/bin/bash

chown -R www-data:www-data /var/www/wordpress

# Attendre que MariaDB soit prêt
until mysqladmin ping -h mariadb --silent; do
    echo "En attente de MariaDB..."
    sleep 5
done

sleep 2

# Vérifier si WordPress est déjà installé
if ! $(wp core is-installed --allow-root); then
    # Télécharger WordPress si nécessaire
    if [ ! -f wp-config.php ]; then
    wp core download --allow-root
	fi

    # Créer le fichier wp-config.php
    if [ ! -f wp-config.php ]; then
        wp config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb --allow-root
    fi
    # Installer WordPress
    wp core install --url="https://localhost:8443" \
                    --title="Webserv is coming" \
                    --admin_user="antoine" \
                    --admin_password="antoine" \
                    --admin_email="antoine@antoine.antoine" \
                    --skip-email \
                    --allow-root

    # Configurer des options supplémentaires si besoin
    wp user create bgrosjea bgrosjea@bgrosjea.bgrosjea --role=author --user_pass=bgrosjea --allow-root
else
    echo "WordPress est déjà installé."
fi
