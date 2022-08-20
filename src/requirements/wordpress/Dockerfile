FROM debian:buster

COPY conf conf

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y mariadb-client
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-cli
RUN apt-get install -y php7.3-mysql

RUN apt-get install -y wget

# RUN	adduser  nginx --disabled-password
# RUN usermod -a -G nginx nginx
COPY conf/php-fpm.conf /etc/php7.3/php-fpm.conf
# COPY conf/www.conf /etc/php7.3/php-fpm.d/www.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp
RUN chmod +x /conf/config.sh

EXPOSE 9000

ENTRYPOINT ["/conf/config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


