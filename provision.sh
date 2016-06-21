#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "Running operating system updates..."
apt-get update
apt-get -y upgrade
echo "Installing required packages..."
apt-get -y install \
	git \
	unzip \
	npm
wget -q http://downloads.sourceforge.net/project/magnolia/magnolia/Magnolia%20CE%204.4.2/magnolia-tomcat-bundle-4.4.2-tomcat-bundle.tar.gz -d /var/lib/tomcat
wget -q http://downloads.sourceforge.net/project/magnolia/magnolia/Magnolia%20CE%205.4.7/magnolia-tomcat-bundle-5.4.7-tomcat-bundle.tar.gz -d /var/lib/tomcat
tar zxvf magnolia-tomcat-bundle-4.4.2-tomcat-bundle.tar.gz
tar zxvf magnolia-tomcat-bundle-5.4.7-tomcat-bundle.tar.gz
