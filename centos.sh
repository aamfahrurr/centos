#!/bin/bash

# initialisasi var
OS=`uname -p`;

# go to root
cd

# install wget and curl
yum -y install wget curl

# update
yum -y update

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

# install webmin
yum -y update
yum -y install gcc*
yum -y install  libpcap*
yum -y install wget
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.831-1.noarch.rpm
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
rpm -U webmin-1.831-1.noarch.rpm

# Install Squid
wget https://raw.githubusercontent.com/aamfahrurr/centos/master/squid.sh && bash squid.sh

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# finalisasi
service sshd restart
service dropbear restart
service webmin restart

# info
clear
AAM FAHRUR
