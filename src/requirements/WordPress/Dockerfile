FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client wget curl

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress
RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php



COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
