#!/bin/bash

clear
echo ""
echo  -e "\t""RDP Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

# configure RDP?
while true
do
  read -r -p "Execute script? [Y/N] " exerdp

  case $exerdp in
    [yY][eE][sS]|[yY])
      break
  ;;
    [nN][oO]|[nN])
      sleep 2
      exit
  ;;
    *)
  esac
done

sudo apt -y install xfce4 xfce4-goodies

sudo apt -y install xrdp

sudo adduser xrdp ssl-cert

echo ""
echo "Set a pwd for user ubuntu"
echo ""

sudo -u root sudo passwd ubuntu

if [ "$EUID" -ne 0 ]
  then
    echo xfce4-session > ~/.xsession
  else
    sudo -u ubuntu echo xfce4-session > ~/.xsession
fi

sleep 2

#sudo -u ubuntu echo xfce4-session > ~/.xsession
#echo xfce4-session > ~/.xsession

exit
