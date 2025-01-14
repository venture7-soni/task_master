##### https://github.com/JetBrains/phpstorm-docker-images/blob/master/php-74-apache-xdebug-30/Dockerfile
FROM php:7.4-apache
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update && apt-get -y install libzip-dev libicu-dev
RUN docker-php-ext-install mysqli zip intl
RUN pecl install xdebug-3.0.3
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/php.ini
#####

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install tools & libraries
RUN apt-get -y install apt-utils nano wget dialog \
    build-essential git curl zip vim libcurl3-dev openssl libpspell-dev

# Dependency for mcrypt
RUN apt-get install -y libmcrypt-dev

# Dependency for sqllite
RUN apt-get -y install libsqlite3-dev libsqlite3-0

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# PHP Extensions

RUN docker-php-ext-install opcache

RUN docker-php-ext-install pspell

RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install pdo_sqlite 
RUN docker-php-ext-install curl 
RUN docker-php-ext-install tokenizer 
RUN docker-php-ext-install json 

RUN apt-get -y install zlib1g-dev
RUN docker-php-ext-install zip 

RUN docker-php-ext-install bcmath 

RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl 

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev

# Enable apache modules
RUN a2enmod rewrite headers expires proxy ssl

RUN yes | pecl install mcrypt
RUN docker-php-ext-enable mcrypt

RUN yes | pecl install apcu
RUN docker-php-ext-enable apcu

RUN docker-php-ext-install calendar

RUN yes | docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

RUN yes | apt-get install default-mysql-client

RUN yes | curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get -y install nodejs

RUN yes | npm install -g grunt-cli

RUN yes | apt-get install ruby-full
RUN yes | gem install bundler
RUN yes | gem install compass
RUN yes | gem install sass
RUN yes | gem install bootstrap-sass

RUN yes | composer self-update --1

# This fails as probably volume has not mounted as of now
# RUN cp /var/taskmasterpro/sandbox/config/home/.my.cnf ~/.my.cnf
