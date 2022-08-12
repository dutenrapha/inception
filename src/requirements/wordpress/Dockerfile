FROM debian:buster

COPY conf conf

RUN apt-get update
RUN apt-get install -y php7
RUN apt-get install -y php7-fpm
RUN apt-get install -y php-mysqli
RUN apt-get install -y wget

RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

RUN bash /conf/config.sh

EXPOSE 9000

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7;"]