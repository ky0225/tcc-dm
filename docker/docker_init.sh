#!/usr/bin/bash
docker cp ./docker_centos/httpd/app.conf ryutoen-web-container:/etc/httpd/conf.d/app.conf
docker cp ./docker_centos/php/00-app.ini ryutoen-web-container:/etc/php.d/
docker exec -it ryutoen-db-container /usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo > ~/timezone.sql
docker exec -it ryutoen-db-container mysql -u root -p -Dmysql < ~/timezone.sql
docker cp ./docker_mysql/my.cnf ryutoen-db-container:/etc/mysql/conf.d/
docker cp ./docker_centos/ssl/localhost.key ryutoen-web-container:/etc/pki/tls/private/
docker cp ./docker_centos/ssl/localhost.crt ryutoen-web-container:/etc/pki/tls/certs/
docker exec -it ryutoen-web-container systemctl restart httpd
docker exec -it ryutoen-db-container service mysql restart
docker exec -it ryutoen-web-container php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
docker exec -it ryutoen-web-container php composer-setup.php --version=1.10.10
docker exec -it ryutoen-web-container php -r "unlink('composer-setup.php');"
docker exec -it ryutoen-web-container mv -f composer.phar /usr/local/bin/composer
