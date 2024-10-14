FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install -y php7.4 php-fpm php-mysql php-curl php-xml php-mbstring php-zip mariadb-client wget curl

# COPY conf/wp-config.php /var/www/wordpress/

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress

RUN mkdir -p /run/php 
# && \
    # chown -R www-data:www-data /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/init_wordpress.sql /docker-entrypoint-initdb.d/init_wordpress.sql

EXPOSE 9000
#exec sans cli avec script sql
# COPY conf/wp_setup.sh /wp_setup.sh
# RUN chmod +x /wp_setup.sh
# CMD ["/bin/bash", "-c", "/wp_setup.sh && php-fpm7.4 -F"]

# exec avec cli
COPY conf/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh
WORKDIR /var/www/wordpress
CMD ["/bin/bash", "-c", "/usr/local/bin/wp.sh && php-fpm7.4 -F"]

#sans rien mais ca marche
# CMD ["php-fpm7.4", "-F"]



