#!/bin/bash

echo "-------------------------> START SYCHRONIZNG <-------------------------------------"

whoami

# ls
mega-login ecruakod73@r0b-in.nl.eu.org R_cA4s_A5aMK8Es
mega-mount
#mega-get /sihati-lab/real/ /var/www/html/
# cp real/*.pdf /var/www/html/service_online/
mega-sync /var/www/html/service_online /sihati-lab/real


echo "-------------------------> END SYCHRONIZNG <-------------------------------------"

