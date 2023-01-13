#!/bin/bash

# DB specific
mysql -e "DROP DATABASE IF EXISTS sandbox;"
mysql -e "DROP DATABASE IF EXISTS settings_sandbox;"
mysql -e "DROP DATABASE IF EXISTS tmp_global;"
mysql -e "DROP USER IF EXISTS sandboxuser@localhost;"
mysql -e "DROP USER IF EXISTS globaluser@localhost;"

mysql -e "CREATE DATABASE sandbox;"
mysql -e "CREATE DATABASE settings_sandbox;"
mysql -e "CREATE DATABASE tmp_global;"
mysql -e "GRANT ALL PRIVILEGES ON sandbox.* TO 'sandboxuser'@'%' IDENTIFIED BY 'Tqs9z/xAqLpmYqiRb4{A';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'globaluser'@'%' IDENTIFIED BY 'dYJ+c&iGD1=Arg8B3Y\$1';"
mysql -e "FLUSH PRIVILEGES;"

cd ~
cp /var/taskmasterpro/sandbox/config/home/.my.cnf .my.cnf
cp /var/taskmasterpro/sandbox/config/apache/phperror_log /etc/logrotate.d/phperror_log

cp /var/taskmasterpro/sandbox/config/apache/conf-available/filetypes.conf /etc/apache2/conf-available/filetypes.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/miscellaneous.conf /etc/apache2/conf-available/miscellaneous.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/performance.conf /etc/apache2/conf-available/performance.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/redirect.conf /etc/apache2/conf-available/redirect.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/security.conf /etc/apache2/conf-available/security.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/ssl.conf /etc/apache2/conf-available/ssl.conf
cp /var/taskmasterpro/sandbox/config/apache/conf-available/uploads.conf /etc/apache2/conf-available/uploads.conf
chmod 644 /etc/apache2/conf-available/*.conf
chown root:root /etc/apache2/conf-available/*.conf
cp /var/taskmasterpro/sandbox/config/apache/local/ssl-vhost.conf /etc/apache2/conf-available/ssl-vhost.conf
cp /var/taskmasterpro/sandbox/config/apache/local/vhost-defaults.conf /etc/apache2/conf-available/vhost-defaults.conf
cp /var/taskmasterpro/sandbox/config/apache/local/vhost-https-redirect.conf /etc/apache2/conf-available/vhost-https-redirect.conf
cp /var/taskmasterpro/sandbox/config/apache/local/vhost-tmp-redirects.conf /etc/apache2/conf-available/vhost-tmp-redirects.conf
mkdir -p /etc/apache2/ssl
cp /var/taskmasterpro/sandbox/config/apache/ssl/local/server.key /etc/apache2/ssl/server.key
cp /var/taskmasterpro/sandbox/config/apache/ssl/local/STAR.TASKMASTERPRO.COM.crt /etc/apache2/ssl/STAR.TASKMASTERPRO.COM.crt
chmod -R 400 /etc/apache2/ssl/
cp /var/taskmasterpro/sandbox/config/apache/local/sandbox.conf /etc/apache2/sites-available/sandbox.conf
cp /var/taskmasterpro/sandbox/config/apache/local/admin.conf /etc/apache2/sites-available/admin.conf
a2ensite sandbox.conf
a2ensite admin.conf
a2dissite 000-default.conf
cp /var/taskmasterpro/sandbox/tmp/config.json /var/taskmasterpro/config.json
cp /var/taskmasterpro/sandbox/config/tmp/local/sandbox.config.json /var/taskmasterpro/sandbox/tmp/code/config/sandbox.config.json
cp /var/taskmasterpro/sandbox/config/tmp/local/tmp.config.json /var/taskmasterpro/sandbox/tmp/code/config/tmp.config.json
cp /var/taskmasterpro/sandbox/config/apache/php.ini /usr/local/etc/php/

# npm and nodejs  handle - later

# composer
#php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
#php /tmp/composer-setup.php --install-dir=/usr/local/bin/ --filename=composer --version=1.10.16
#rm /tmp/composer-setup.php
composer global require nategood/httpful

#code env
cp /var/taskmasterpro/sandbox/config/code/.env /var/taskmasterpro/sandbox/tmp/code/.env

#laravel
cd ~
cp /var/taskmasterpro/sandbox/config/laravel/local/.env /var/taskmasterpro/sandbox/tmp/laravel/.env

#apache
a2enconf filetypes
a2enconf miscellaneous
a2enconf performance
a2enconf redirect
a2enconf security
a2enconf ssl
a2enconf uploads

a2enmod actions
a2enmod expires
a2enmod headers
a2enmod rewrite
a2enmod ssl

service apache2 reload

#attachment
mkdir -p /var/qmrp && chmod -R 777 /var/qmrp
mkdir -p /var/qmrp/do_spaces_temp_downloads && chmod -R 777 /var/qmrp/do_spaces_temp_downloads