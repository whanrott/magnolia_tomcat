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
	npm \
	ca-certificates-java
apt-get remove openjdk-7-jre-headless
wget http://launchpadlibrarian.net/226983664/openjdk-7-jre-headless_7u91-2.6.3-0ubuntu0.15.10.1_amd64.deb
dpkg -i openjdk-7-jre-headless_7u91-2.6.3-0ubuntu0.15.10.1_amd64.deb
sudo -u www-data sh bin/magnolia_control.sh start
echo "cleanup tasks"
sudo updatedb
