#!/bin/bash

echo "---------------------------PRE INSTALL --------------------------------------"

echo "version :"
# pwd
# ls

# lsb_release -a
curl -LOks https://mega.nz/linux/repo/Debian_11/amd64/megasync-Debian_11_amd64.deb 
curl -LOks https://mega.nz/linux/repo/Debian_11/amd64/megacmd-Debian_11_amd64.deb


cp *.deb /tmp/ 
ls /tmp/
apt install /tmp/megasync-Debian_11_amd64.deb -y 2>/dev/null >/dev/null

apt install /tmp/megacmd-Debian_11_amd64.deb -y 2>/dev/null >/dev/null
rm /tmp/*.deb

echo "---------------------------> PRE INSTALL  DONNE <--------------------------------------"
