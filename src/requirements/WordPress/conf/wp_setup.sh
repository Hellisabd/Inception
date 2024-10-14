#!/bin/bash

echo bonjour enculer tu vas marcher un jour?

# Attendre que MariaDB soit prête
until mysql -hmariadb -ubgrosjea -pbgrosjea -e "SHOW DATABASES;" > /dev/null 2>&1; do
  echo "En attente de MariaDB..."
  sleep 5
done

# Exécuter le script SQL pour initialiser WordPress
mysql -hmariadb -ubgrosjea -pbgrosjea maria < /docker-entrypoint-initdb.d/init_wordpress.sql

echo "Installation WordPress terminée."