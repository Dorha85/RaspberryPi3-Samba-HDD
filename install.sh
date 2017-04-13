#!/bin/bash
clear

read -r -p "This script will make changes to your system. Are you sure that you wish to continue? [y/N] " confirm

if [[ $confirm =~ ^([yY][eE][sS]|[yY])$ ]]
then
	clear
	echo "Updating package lists"
fi
	sudo apt-get update -y

	echo "Upgrade package lists"
	sudo apt-get upgrade -y

echo "Ready to install Samba and too settings for HDD -DSA-version1"
sleep 3
echo "You can check your HDD UUID"
echo "UUID="B6DE5141DE50FB57"  /media/USBHDD1"
sleep 4
sudo blkid
sleep 7

clear
echo "3- Install samba"
sudo apt-get install samba samba-common-bin -y
sleep 2

clear
echo "4- BackUp fstab"
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.old
sleep 2

echo "5- Instal usbmount"
sudo apt-get install usbmount -y
sleep 2

clear
echo "6- Instal ntfs-3g"
sudo apt-get install ntfs-3g -y
sleep 5

clear
echo "7- sudo mkdir /media/USBHDD1"
sudo mkdir /media/USBHDD1
sleep 2

echo "9- UnMount:USBHDD1"
sudo umount /media/USBHDD1 && sudo umount /dev/sda1
sleep 4

echo "10- Change file fstab"
sudo cp ./config-files/fstab /etc/

sleep 2
sudo chown -R pi:pi /media/USBHDD1
sleep 2
sudo mount -a

echo "Samba configuration"
sudo mount /dev/sda1 /media/USBHDD1 -o uid=pi,gid=pi
sleep 2

clear
echo "11- BackUp smb.conf"
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.old
sleep 1

echo "12- Change file smb.conf"
sudo cp ./config-files/smb.conf /etc/samba/

echo "13- service restart"
sudo service smbd restart && sudo /etc/init.d/samba restart
sleep 3

echo "14- service / sudo blkid"
sudo samba --version

	echo "================================================================"
	echo "=================== Configuration complete! ===================="
	echo "================================================================"
	sleep 10

	exit 0

#else
 #   exit 1

fi
