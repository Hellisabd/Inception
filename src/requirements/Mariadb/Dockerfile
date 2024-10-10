FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install systemctl -y
RUN apt-get install sudo -y

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /etc/mariadb.sh
COPY conf/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

RUN chown mysql:mysql /var/lib/mysql && chmod -R 777 /var/lib/mysql

RUN chmod +x etc/mariadb.sh

CMD ["sh", "/etc/mariadb.sh"]
