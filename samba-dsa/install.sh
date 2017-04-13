#!/bin/sh
clear

echo "Ready to install Samba and HDD -DSA-version1"
sleep 2

echo "1- Instal update"
sudo apt-get update -y
sleep 2

clear
echo "2- Instal upgrade"
sudo apt-get upgrade -y
sleep 2

clear
echo "3- Instal samba"
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
sleep 2

echo "10- Change file fstab"
sudo cp /home/pi/DSAsamba/fstab /etc/
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
sudo cp /home/pi/DSAsamba/smb.conf /etc/samba/

echo "13- service restart"
sudo service smbd restart && sudo /etc/init.d/samba restart
sleep 3

echo "14- service"
sudo samba --version
