# ATTENTION: If you want to alter this file, be sure to rebuild the container afterwards! ($ docker-compose up --build)

# use the desired PHP version
FROM php:7.1-apache
# FROM php:5.6.37-apache

# use this if you want to use environment specific .htaccess files
# COPY webroot/.local.htaccess /var/www/html/.htaccess

# COPY docker/entrypoint.sh /entrypoint.sh
COPY docker/php/ini-config/ /usr/local/etc/php/conf.d/

# install extensions, bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip

RUN apt-get update \
	&& apt-get install -y \
		curl \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		# libpng12-dev \
		libmcrypt-dev \
		libjpeg-dev \
		libpng-dev \
		net-tools \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install \
		mysqli \
		pdo \
		pdo_mysql \
		mbstring \
		gd \
		iconv \
		mcrypt \
		opcache \
	&& pecl install \
		# redis-3.1.0 \
		xdebug-2.5.0 \
	&& docker-php-ext-enable \
		# redis \
		xdebug \
	&& a2enmod \
		rewrite \
		expires \
		headers \
	&& echo "xdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.remote_host=127.0.0.1" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.var_display_max_depth=-1" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.var_display_max_children=-1" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.var_display_max_data=-1" >> /usr/local/etc/php/conf.d/xdebug.ini

# add these to the RUN statement to install (docker says "comments" cannot exist within continuation lines)
# && echo "xdebug.idekey=xdebug-atom" >> /usr/local/etc/php/conf.d/xdebug.ini \
# && mkdir -p /tmp/php/ini-config/ \
# && chmod 0755 /entrypoint.sh \
# && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug-zend_extension.ini
# && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" >> /usr/local/etc/php/conf.d/xdebug.ini
