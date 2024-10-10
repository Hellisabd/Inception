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


EXPOSE 9000

CMD ["php-fpm7.4", "-F"]


