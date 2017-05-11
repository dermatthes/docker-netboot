#!/bin/bash


set -e


cd /opt/tftp
wget http://ftp.de.debian.org/debian/dists/Debian8.8/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar -xzf netboot.tar.gz

ln -s /opt/variant/debian/preseed.cfg /var/www/html/preseed.cfg