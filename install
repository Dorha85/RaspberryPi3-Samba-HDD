#!/bin/bash
clear
read -r -p "This script will make changes to your system which may break some applications. Are you sure that you wish to continue? [y/N] " confirm

if [[ $confirm =~ ^([yY][eE][sS]|[yY])$ ]]
then
	clear
	echo "Updating package lists"

	apt-get -y -qq update

	echo "Installing dependencies"

	apt-get -y -qq install hostapd udhcpd

echo "Ready to install Samba and HDD -DSA-version1"
sleep 2

echo "1- Instal update"
sudo apt-get update -y
sleep 2

clear
echo "2- Instal upgrade"
sudo apt-get upgrade -y
sleep 2

echo "14- service"
sudo samba --version
