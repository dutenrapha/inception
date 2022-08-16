#!/bin/sh

service mysql start
mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"