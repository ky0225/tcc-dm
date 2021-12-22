#!/usr/bin/bash
docker cp ./docker_alma/httpd/app.conf tcc-dm-web-container:/etc/httpd/conf.d/app.conf
docker cp ./docker_alma/php/00-app.ini tcc-dm-web-container:/etc/php.d/
docker exec -it tcc-dm-db-container /usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo > ~/timezone.sql
docker exec -it tcc-dm-db-container mysql -u root -p -Dmysql < ~/timezone.sql
docker cp ./docker_mysql/my.cnf tcc-dm-db-container:/etc/mysql/conf.d/
docker cp ./docker_alma/ssl/localhost.key tcc-dm-web-container:/etc/pki/tls/private/
docker cp ./docker_alma/ssl/localhost.crt tcc-dm-web-container:/etc/pki/tls/certs/
docker exec -it tcc-dm-web-container systemctl restart httpd
docker exec -it tcc-dm-db-container service mysql restart
docker exec -it tcc-dm-web-container php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
docker exec -it tcc-dm-web-container php composer-setup.php --version=1.10.10
docker exec -it tcc-dm-web-container php -r "unlink('composer-setup.php');"
docker exec -it tcc-dm-web-container mv -f composer.phar /usr/local/bin/composer
