#!/bin/sh

# user enable to run script :: root:

if [ "$(echo $LFS)" = "" ]; then
	printf "\033[31m[ { ✗ }ERROR  ] LFS variable not present. Check step 1\033[0m\n"
	exit 1
else
	printf "\033[32m[ { ✓ }SUCCESS ] LFS variable was set successfully\033[0m\n"
fi 

#  Creating Network Interface Configuration Files

# The following command creates a sample file for the enp0s3
# device with a static IP address:
cd /etc/sysconfig/

echo "
ONBOOT=yes
IFACE=enp0s3
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
" > ifconfig.enp0s3

# Creating the /etc/resolv.conf File
echo "
# Begin /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
# End /etc/resolv.conf
" > /etc/resolv.conf

# Configuring the system hostname
echo "piranucc" > /etc/hostname

echo "
# Begin /etc/hosts
127.0.0.1 <HOSTNAME.example.org> <HOSTNAME> localhost
::1       localhost
# End /etc/hosts
" > /etc/hosts

printf "\033[32m[ { ✓ }SUCCESS ] \033[0m\n"

