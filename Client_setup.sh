#!/bin/bash

# !!!!!! finish note-fun no fun thingy

clear
echo ""
echo  -e "\t""Ubuntu Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

#
while true
do
  read -r -p "Is this the client? [Y/N] " cl

  case $cl in
    [yY][eE][sS]|[yY])
    bash ./Client/Client_routing.sh
    bash ./Basic_setup.sh
    bash ./Client/RDP_setup.sh
    clear

    exit
  ;;
    [nN][oO]|[nN])
    break
  ;;
    *)
esac
done

# Conect to client
echo "Conect to client"
echo ""
read -r -p "Client ip - " cip
echo ""
read -r -p "Locate public key - " pkey
echo ""
while true
do
  read -r -p "Client ip - $cip

  Public key - $pkey

  Is this right? " ipkeyq
  case $ipkeyq in
    [yY][eE][sS]|[yY])
      break
  ;;
    *)
  esac
done

chmod 400 $pkey
ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/Client_routing.sh
ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Basic_setup.sh
ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/RDP_setup.sh
exit
