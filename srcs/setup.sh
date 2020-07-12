# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apuchill <apuchill@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/09 10:50:25 by apuchill          #+#    #+#              #
#    Updated: 2020/07/12 16:02:33 by apuchill         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# This setup configuration file installs and configures the following packages:
# - Nginx Web Server
# - SSL Certificate
# - phpMyAdmin
# - MySQL
# - WordPress CMS

# setup files' directory
SETUP_DIR=/tmp/setup
cd $SETUP_DIR
# ft_server's directory
SERVER_DIR=/var/www/localhost

# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# NGINX server configuration
# - Reference:
# https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/

# NGINX directory
NGINX_DIR=/etc/nginx
# Remove example configuration file
rm $NGINX_DIR/sites-enabled/default
# Move NGINX configuration file to correct directory
mv $SETUP_DIR/ft_server.com.conf /etc/nginx/sites-available/
# Enable site by creating symlink to NGINX's sites-enabled folder
ln -s $NGINX_DIR/sites-available/ft_server.com.conf $NGINX_DIR/sites-enabled/


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# SSL Certificate configuration
# - C=country ST=state L=location O=organization CN=name
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj '/C=BR/ST=SP/L=SP/O=42saopaulo/CN=apuchill' \
	-keyout /etc/ssl/certs/localhost.key \
	-out /etc/ssl/certs/localhost.crt


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# MySQL database setup and configuration (without password)
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
mysqladmin --user=root password ""


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# phpMyAdmin setup and configuration

# phpMyAdmin directory
PHPMYADMIN_DIR=$SERVER_DIR/phpmyadmin
# Extract and move folder to correct directory
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
tar -xf phpMyAdmin-5.0.2-english.tar.gz
rm -rf phpMyAdmin-5.0.2-english.tar.gz
echo "ls:" && ls
mv phpMyAdmin-5.0.2-english $SERVER_DIR/phpmyadmin
cp -pr $SETUP_DIR/config.inc.php $SERVER_DIR/phpmyadmin/config.inc.php
chown -R www-data:www-data $SERVER_DIR/phpmyadmin


# -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-
# Wordpress setup and configuration

# Wordpress directory
WORDPRESS_DIR=$SERVER_DIR/wordpress
# Extract and move folder to correct directory
tar -xf $SETUP_DIR/wordpress-5.3.2-pt_BR.tar.gz
rm -rf $SETUP_DIR/wordpress-5.3.2-pt_BR.tar.gz
mv $SETUP_DIR/wp-config.php $SETUP_DIR/wordpress/wp-config.php
mv $SETUP_DIR/wordpress $SERVER_DIR/
mv $SETUP_DIR/info.php $SERVER_DIR/
