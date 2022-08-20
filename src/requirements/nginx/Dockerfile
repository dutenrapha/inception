FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./tools/default /etc/nginx/sites-enabled/default
COPY ./conf/config.sh /var/www

RUN chmod +x /var/www/config.sh

ENTRYPOINT [ "var/www/config.sh" ]

CMD ["nginx", "-g", "daemon off;"]
