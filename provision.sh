#!/bin/bash

#-- Give your project an abbreviation
export PROJECT_ABBR='starkey'

if [ -f ~/runonce ]
then
  exit 0;
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq

cat << MYSQL_PRESEED | debconf-set-selections
mysql-server-5.1 mysql-server/root_password password $PROJECT_ABBR
mysql-server-5.1 mysql-server/root_password_again password $PROJECT_ABBR
mysql-server-5.1 mysql-server/start_on_boot boolean true
MYSQL_PRESEED
apt-get install -f -y mysql-server
mysql -u root -p$PROJECT_ABBR -e "CREATE DATABASE $PROJECT_ABBR"
mysql -u root -p$PROJECT_ABBR $PROJECT_ABBR < /var/www/$PROJECT_ABBR/_init.sql

apt-get install -y apache2 curl php5 php5-mysql php5-gd php5-curl mysql-client zip unzip

cat > /etc/apache2/sites-available/$PROJECT_ABBR.conf <<DELIM
<VirtualHost *:80>
  ServerName $PROJECT_ABBR.local
  DirectoryIndex index.php
  DocumentRoot /var/www/$PROJECT_ABBR/www/
  <Directory "/var/www/$PROJECT_ABBR/www/">
    <IfModule mod_rewrite.c>
    RewriteEngine On

    # Removes index.php from ExpressionEngine URLs
    RewriteCond %{THE_REQUEST} ^GET.*index\.php [NC]
    RewriteCond %{REQUEST_URI} !/system/.* [NC]
    RewriteRule (.*?)index\.php/*(.*) /$1$2 [R=301,NE,L]

    # Directs all EE web requests through the site index file
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ /index.php/$1 [L]
    </IfModule>
  </Directory>
</VirtualHost>
DELIM

a2enmod rewrite
a2ensite $PROJECT_ABBR.conf
a2dissite 000-default
/etc/init.d/apache2 restart

IP=`ifconfig eth1 | sed -ne's/\W*inet addr:\W*\([0-9\.]\{7,15\}\).*/\1/p'`
echo "Add to your /etc/hosts file: $IP $PROJECT_ABBR.local";

touch ~/runonce
