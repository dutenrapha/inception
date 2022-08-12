FROM debian:buster

COPY conf conf

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/rdutenke.pem \
        -keyout /etc/nginx/ssl/rdutenke.key \
        -subj "/C=BR/ST=SP/L=SP/O=42/OU=SP/CN=rdutenke/"

# nginx conf
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
