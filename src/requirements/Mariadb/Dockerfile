FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /etc/mariadb.sh

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

RUN chmod +x etc/mariadb.sh

CMD ["sh", "/etc/mariadb.sh"]
