FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client wget curl
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY /conf/wp-config.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN cd /var/www/wordpress && \
	until wp db check --allow-root; do echo "Waiting for database..."; sleep 5; done && \
    wp core config --dbname=wordpress --dbuser=wpuser --dbpass=wppassword --dbhost=mysql --allow-root && \
    wp core install --url="http://localhost:8080" --title="Mon Site WordPress" --admin_user="admin" --admin_password="adminpassword" --admin_email="admin@example.com" --skip-email --allow-root


EXPOSE 9000

CMD ["php-fpm7.4", "--nodaemonize"]
