FROM debian:buster

ARG MYSQL_USER

COPY conf conf

RUN apt-get update
RUN apt-get install -y mariadb-server
RUN	mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

RUN bash /conf/config.sh

CMD	["mysqld", "--bind-address=0.0.0.0"]



