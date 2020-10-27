FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y \
        libfreetype6-dev \
        libjpeg62-dev \
        libpng-dev \
        git nginx gettext openssl php-fpm=2:7.4+75 php7.4-pgsql npm composer php7.4-curl php7.4-dom php7.4-gd

RUN mkdir /easyappointments
WORKDIR /easyappointments

RUN apt install php-mysqlnd

COPY ./gen_certs.sh /gen_certs.sh
COPY ./config.php.template /config.php.template
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh