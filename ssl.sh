#!/bin/bash
apt-get install stunnel4

wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/syahrul23/VPS-Script-SSL/master/stunnel.conf"

openssl genrsa -out key.pem 2048

openssl req -new -x509 -key key.pem -out cert.pem -days 1095

cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4

/etc/init.d/stunnel4 restart
