#!/bin/bash

clear
echo ""
echo "\t""RDP Client Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install xfce4 xfce4-goodies

apt -y install xrdp

adduser xrdp ssl-cert

echo ""
passwd ubuntu

sudo -u ubuntu echo xfce4-session > ~/.xsession


exit
