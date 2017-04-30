#!/bin/bash

# initialisasi var
OS=`uname -p`;

# go to root
cd

# install wget and curl
yum -y install wget curl

# install webmin
yum -y update
yum -y install gcc*
yum -y install  libpcap*
yum -y install wget
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.831-1.noarch.rpm
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
rpm -U webmin-1.831-1.noarch.rpm

sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf

# install dropbear
yum -y update
yum -y install nano
yum -y install wget
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install dropbear
echo "OPTIONS=\"-p 443 -p 80\"" > /etc/sysconfig/dropbear
echo "/bin/false" >> /etc/shells
service dropbear restart
chkconfig dropbear on

# Install Squid
wget https://raw.githubusercontent.com/aamfahrurr/centos/master/squid.sh && bash squid.sh
service squid restart
chkconfig squid on

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# info
clear
echo "SELESAI"
