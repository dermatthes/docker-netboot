#!/bin/bash

## set -e: Stop on error
set -e


ifconfig $NET_IF
if [[ $? != 0 ]]
then
    echo "[ERROR!] Failed to autodetect ip address on interface: $NET_IF"
    echo "[ERROR!] Try setting -e NET_IF to the correct network interface"
    echo "[FAIL!]"
    exit 255;
fi

export PXE_SERVER_IP=$(ifconfig $NET_IF | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')
echo Autodetect PXE_SERVER_IP: $PXE_SERVER_IP




# Using DHCP Proxy Mode
if [ $DHCP_RANGE = '0' ]
then
    DHCP_RANGE_SET="$PXE_SERVER_IP,proxy"
else
    DHCP_RANGE_SET="$DHCP_RANGE"
fi
echo "DHCP_RANGE_SET is $DHCP_RANGE_SET"



echo "Downloading netboot image..."


/opt/variant/debian/download-pxe.sh

echo "Starting dnsmasq..."

dnsmasq \
    --dhcp-range=$DHCP_RANGE_SET \
    --dhcp-no-overrid \
    --dhcp-boot=pxelinux.0,pxeserver,$PXE_SERVER_IP \
    --pxe-service=x86PC,"Docker-Netboot",pxelinux \
    --enable-tftp \
    --tftp-root=/opt/tftp \
    --user=root