FROM centos:7
RUN \
  yum -y install \
    httpd \
    php \
    php-cli \
    php-common \
    mod_ssl \
    openssl

RUN echo "<?php phpinfo(); ?>" > /var/www/html/hola.php

COPY AdminLTE-3_wz /var/www/html

COPY docker.crt /docker.crt

COPY docker.key /docker.key

COPY ssl.conf /etc/httpd/conf.d/default.conf

EXPOSE 443

CMD apachectl -DFOREGROUND

