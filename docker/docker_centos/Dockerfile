FROM centos:7

MAINTAINER "tomioka"<tomioka.r@marietta.co.jp>

ENV HOSTNAME web-server

RUN yum check-update; \
        yum clean all; \
        yum update -y; \
        yum install -y vim net-tools; \
        yum install -y epel-release; \
        : '# Repository install'&& \
        rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm; \
        : '# Apache 2.4 install' && \
        yum install -y httpd mod_ssl; \
        systemctl enable httpd.service; \
        mkdir /var/www/app; \
        : '# PHP 7.3 install' && \
        yum install -y --enablerepo=remi,remi-php73 php php-gd php-mysqlnd php-mbstring php-xml php-pgsql php-pdo php-devel php-pear php-tidy php-pecl-zip php-pecl-mcrypt; \
        : '# PHP composer install' && \
        curl https://getcomposer.org/installer | php && \
        mv -i composer.phar /usr/local/bin/composer && \
        : '# zip install' && \
        yum install -y zip; \
        : '# upzip install' && \
        yum install -y unzip; \
        : '# upzip install' && \
        yum install -y git; \
        : '# cron install' && \
        yum install -y crontabs; \
        : '# ImageMagick install' && \
        yum install -y ImageMagick; \
        : '# ImageMagick-devel install' && \
        yum install -y ImageMagick-devel; \ 
        : '# ipa-font install' && \
        yum install -y ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts
