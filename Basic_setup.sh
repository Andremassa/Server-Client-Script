#!/bin/bash

# This is a Dumb script to update upgrade and some basic packages :)

clear
echo ""
echo  -e "\t""Ubuntu Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

echo "- Let's get serious!"
echo ""
sleep 1
echo "Updating everything..."
echo ""
sleep 1
apt -y update && apt -y upgrade

clear
echo ""
echo  -e "\t""Ubuntu Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""

echo "Installing packages..."
echo ""
sleep 2
apt -y install vim git locate tree htop net-tools unzip
apt -y update && apt -y upgrade
echo ""
echo "All done!!!"
echo ""
sleep 3
clear

exit
