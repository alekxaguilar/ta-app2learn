FROM php:apache

RUN apt-get update && apt upgrade -y && apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libmcrypt-dev \
 libpng-dev \
 libxpm-dev \
 libzip-dev \
 libwebp-dev \
 curl \
 git \
 vim

# Install extensions using the helper script provided by the base image
RUN docker-php-ext-install zip pdo_mysql mysqli -j$(nproc) iconv && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) gd 

RUN usermod -u 1000 www-data

WORKDIR /tmp
# tested version 3.0.3.8
# tested version 4.0.1.1
RUN git clone --branch 4.0.1.1 --single-branch https://github.com/opencart/opencart.git 

# WORKDIR /tmp/opencart
RUN  mv opencart/upload/config-dist.php opencart/upload/config.php && mv opencart/upload/admin/config-dist.php opencart/upload/admin/config.php \
 && cp -R opencart/upload/* /var/www/html/

WORKDIR /var/www/html

RUN chmod 777 config.php \
 && chmod 777 admin/config.php \
 && chmod 777 -R system \
 && chmod 777 -R image \
 && sed -i 's/'MYSQL40'/''/g' install/cli_install.php \ 
 && sed -i 's/'MYSQL40'/''/g' install/model/install/install.php 

ADD ./opencart.ini /usr/local/etc/php/conf.d
ADD ./scripts/complete-install.sh /tmp

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80 443