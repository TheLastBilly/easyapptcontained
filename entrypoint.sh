#!/bin/sh

if [ ! -f /easyappointments/config.php ]; then
    rm -rf /easyappointments/*

    cd /
    git clone --depth=1 https://github.com/alextselegidis/easyappointments easyappointments

    cd easyappointments
    npm install
    composer install
fi

chown www-data:www-data -R /easyappointments
envsubst < "/config.php.template" > "/easyappointments/config.php"

if [ -f "/certs/recreate" ]; then
    cd /
    /gen_certs.sh
    cat cert.crt > /certs/cert.crt
    cat cert.key > /certs/cert.key

    rm /certs/recreate
fi

cd /easyappointments
npm start &
/usr/sbin/php-fpm7.4 &
nginx -g 'daemon off;'