FROM debian:buster


COPY conf conf

RUN apt-get update
RUN apt-get install -y mariadb-server

RUN bash /conf/config.sh

EXPOSE 3306


CMD ["mysqld"]