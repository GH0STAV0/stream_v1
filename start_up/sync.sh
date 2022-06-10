#!/bin/bash
# set -x
echo "-------------------------> START SYCHRONIZNG <-------------------------------------"
supervisorctl status
whoami
mkdir -p /var/www/html/service_online
chown -R www-data:www-data /var/www/html/service_online
pwd
# /usr/bin/mega-quit
sleep 2
# ls
bash -c 'su www-data /usr/bin/mega-login "ecruakod73@r0b-in.nl.eu.org" "R_cA4s_A5aMK8Es"'
bash -c 'su www-data /usr/bin/mega-mount'
#mega-get /sihati-lab/real/ /var/www/html/
# cp real/*.pdf /var/www/html/service_online/
bash -c 'su www-data /usr/bin/mega-sync /var/www/html/service_online /sihati-lab/real'

echo "sleep for 5 seconds "
sleep 5
echo "sleep Done"

echo "-------------------------> END SYCHRONIZNG <-------------------------------------"

