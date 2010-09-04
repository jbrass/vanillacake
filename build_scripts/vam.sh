#!/bin/bash -ex
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server apache2 php5 subversion php5-mysql php5-gd
mysqladmin -u root password cake
sudo a2enmod rewrite
cd /var/www
sudo rm index.html
sudo svn export --force http://vamcart.googlecode.com/svn/trunk .
sudo chmod -R 777 /var/www/app/tmp
sudo chmod -R 777 /var/www/config.php
mysql -u root -pcake -e "create database vamcart";
sudo sed  -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/sites-available/default
sudo /etc/init.d/apache2 restart
