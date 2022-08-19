FROM debian:buster

COPY conf conf

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y mariadb-server
RUN	mkdir -p /var/run/mysqld \
 	&& chown -R mysql:mysql /var/run/mysqld

RUN chmod +x /conf/config.sh
RUN /conf/config.sh
RUN service mysql start && mysql < initial_db.sql

EXPOSE 3306

CMD	["mysqld", "--bind-address=0.0.0.0"]
