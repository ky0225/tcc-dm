FROM almalinux:8

MAINTAINER "yamamoto.k"<yamamoto.k@marietta.co.jp>

ENV HOSTNAME web-server

# サーバの日付合わせ
RUN /bin/cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# epel-releaseのインストール
RUN dnf install -y epel-release &&\
    dnf clean all

# remiのインストール
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# dnfのアップデート
RUN dnf update -y &&\
    dnf clean all

# 必要なモジュールのインストール(apache）
RUN dnf -y install httpd &&\
    dnf clean all

# 必要なモジュールのインストール（php8.1）
RUN dnf -y install php81-php php81-php-mysqli php81-php-gd php81-php-mbstring php81-php-opcache php81-php-xml php81-php-pear php81-php-devel php81-php-pecl-imagick php81-php-pecl-imagick-devel php81-php-pecl-zip

# phpコマンドを作成
RUN ln /usr/bin/php81 /usr/bin/php

# wordpressインストールディレクトリの所有者をapacheユーザに変更
RUN chown -R apache:apache /var/www/html

# pho81-php-fpmのサービス永続化
RUN systemctl enable php81-php-fpm

# apache サーバのサービス永続化
RUN systemctl enable httpd
