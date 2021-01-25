#!/bin/bash

clear
echo ""
echo  -e "\t""RDP Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

sudo apt -y install xfce4 xfce4-goodies

sudo apt -y install xrdp

sudo adduser xrdp ssl-cert

echo ""
echo "Set a pwd for user ubuntu"
echo ""

sudo -u root sudo passwd ubuntu

#sudo -u ubuntu echo xfce4-session > ~/.xsession

echo xfce4-session > ~/.xsession

exit
