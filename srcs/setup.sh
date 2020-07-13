# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apuchill <apuchill@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/09 10:50:25 by apuchill          #+#    #+#              #
#    Updated: 2020/07/12 18:11:42 by apuchill         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# This setup configuration file installs and configures the following packages:
# - Nginx Web Server
# - SSL Certificate
# - phpMyAdmin
# - MySQL
# - WordPress CMS

# create ft_server's directory
SERVER_DIR=/var/www/localhost
mkdir $SERVER_DIR
# cd to setup files' directory
cd /tmp/setup


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# NGINX server configuration
# - Reference:
# https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/

# NGINX directory
NGINX_DIR=/etc/nginx
# Move NGINX configuration file to correct directory
mv nginx.conf /etc/nginx/sites-available/
# Remove example configuration file
rm $NGINX_DIR/sites-enabled/default
# Enable site by creating symlink to NGINX's sites-enabled folder
ln -s $NGINX_DIR/sites-available/nginx.conf $NGINX_DIR/sites-enabled/


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# SSL Certificate configuration
# - C=country ST=state L=location O=organization CN=name

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj '/C=BR/ST=SP/L=SP/O=42/OU=42saopaulo/CN=apuchill' \
	-keyout /etc/ssl/certs/localhost.key \
	-out /etc/ssl/certs/localhost.crt


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# phpMyAdmin setup and configuration

# phpMyAdmin directory
PHPMYADMIN_DIR=$SERVER_DIR/phpmyadmin
# Extract and move folder to correct directory
# wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
tar -xf phpMyAdmin-5.0.2-english.tar.gz
rm -rf phpMyAdmin-5.0.2-english.tar.gz
mv phpMyAdmin-5.0.2-english $SERVER_DIR/phpmyadmin
cp config.inc.php $SERVER_DIR/phpmyadmin/config.inc.php
chown -R www-data:www-data $SERVER_DIR/phpmyadmin


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# MySQL database setup and configuration (without password)
USER=user42
service mysql start
mysql -e "CREATE USER '$USER' IDENTIFIED BY '$USER';"
mysql -e "CREATE DATABASE phpmyadmin;"
mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$USER';"


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# Wordpress setup and configuration

# Wordpress directory
WORDPRESS_DIR=$SERVER_DIR/wordpress
# Extract and move folder to correct directory
tar -xf wordpress-5.3.2-pt_BR.tar.gz
rm -rf wordpress-5.3.2-pt_BR.tar.gz
mv wp-config.php wordpress/wp-config.php
mv wordpress $SERVER_DIR/
