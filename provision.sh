#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "Running operating system updates..."
apt-get update
apt-get -y upgrade
echo "Installing required packages..."
apt-get -y install \
	openjdk-7-jre-headless \
	git \
	unzip \
	npm
sudo -u www-data wget --quiet http://downloads.sourceforge.net/project/magnolia/magnolia/Magnolia%20CE%204.4.2/magnolia-tomcat-bundle-4.4.2-tomcat-bundle.tar.gz -d /var/lib/tomcat
sudo -u www-data wget --quiet http://downloads.sourceforge.net/project/magnolia/magnolia/Magnolia%20CE%204.4.8/magnolia-tomcat-bundle-4.4.8-tomcat-bundle.tar.gz 
sudo -u www-data wget --quiet http://downloads.sourceforge.net/project/magnolia/magnolia/Magnolia%20CE%205.4.7/magnolia-community-demo-bundle-5.4.7-tomcat-bundle.tar.gz -d /var/lib/tomcat
cd /var/lib/tomcat
sudo -u www-data tar zxvf magnolia-tomcat-bundle-4.4.2-tomcat-bundle.tar.gz
sudo -u www-data tar zxvf magnolia-tomcat-bundle-4.4.8-tomcat-bundle.tar.gz
sudo -u www-data tar zxvf magnolia-community-demo-bundle-5.4.7-tomcat-bundle.tar.gz

echo "initialise magnolia 4.4.2. NB: there is an error in setenv.sh - the -a switch should be -e"
sudo -u www-data mv magnolia-4.4.2/apache-tomcat-6.0.29/* .


sudo -u www-data sh bin/setenv.sh
sudo -u www-data sh bin/magnolia_control.sh start



echo "cleanup tasks"
sudo updatedb
