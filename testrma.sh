#!/bin/sh

#Cek isi Directory Kosong atau tidak
if [ ! -z "$(ls -A /etc/nginx/conf.d)" ]; then
    echo "Ada file konfigurasi disini, Maka file konfigurasi default tidak terbentuk"
else
    echo "Tidak ada file konfigurasi disini, lanjut copy file konfigurasi default"
    envsubst '$REVERSE_HOST' < /etc/nginx/custom_conf/default.conf.template > /etc/nginx/conf.d/default.conf
fi

exec nginx -g 'daemon off;'
