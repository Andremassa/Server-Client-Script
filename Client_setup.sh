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

echo -e "\t Copy your public key into the text editor"
echo ""
read -n 1 -s -r -p "- Press any key to to open the text editor -"
echo ""

nano ./key.pem
chmod 400 $pkey

clear
echo ""
echo  -e "\t""Ubuntu Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

while true
do
  echo ""
  read -r -p "Type the Client ip -" cip
  echo ""
  echo "client ip - $cip"
  read -r -p "Is this right? [Y/N]" ipkeyq
  case $ipkeyq in
    [yY][eE][sS]|[yY])
      break
  ;;
    *)
  esac
done

clear
echo ""
echo  -e "\t""Ubuntu Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

scp -i ./key.pem ./Server-Client-Script/Client ubuntu@$cip:/home/ubuntu/

echo "Chage yor sudo passwd and login as root"
echo ""
echo "Copy and run the following lines"
echo -e "\t" "Run \"bash ./Client/Client_routing.sh && bash ./Client/RDP_routing.sh\""
echo ""
ssh -i ./key.pem ubuntu@$cip


# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/Client_routing.sh
# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Basic_setup.sh
# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/RDP_setup.sh
exit
