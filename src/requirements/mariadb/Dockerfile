FROM debian:buster

COPY conf conf

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y mariadb-server
RUN	mkdir -p /var/run/mysqld \
 	&& chown -R mysql:mysql /var/run/mysqld
RUN chmod +x /conf/config.sh
EXPOSE 3306

ENTRYPOINT ["/conf/config.sh"]
CMD	["mysqld", "--bind-address=0.0.0.0"]