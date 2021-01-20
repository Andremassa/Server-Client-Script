#!/bin/bash

# This is a Dumb script to update upgrade and some basic packages :)

clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 2

echo "- Let's get serious!"
echo ""
sleep 1
echo "Updating everything..."
echo ""
sleep 1
apt -y update && apt -y upgrade

clear
echo ""
echo "Installing packages..."
echo ""
sleep 2
apt -y vim git locate tree htop net-tools unzip tasksel fish neofetch
apt -y update && apt -y upgrade
echo ""
echo "All done!!!"
echo ""
echo "Goodbye :)"
sleep 3
clear
exit
