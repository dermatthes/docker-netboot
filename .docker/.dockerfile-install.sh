#!/bin/bash

## set -e: Stop on error
set -e

apt-get update
apt-get install -y dnsmasq pxelinux syslinux wget net-tools openssh-client apache2

