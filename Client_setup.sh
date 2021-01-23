#!/bin/bash

# !!!!!! finish note-fun no fun thingy

clear
echo ""
echo  -e "\t""Ubuntu Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3


while true
do
  read -r -p "Is this the client? [Y/N] " cl

  case $cl in
    [yY][eE][sS]|[yY])
    bash ./Client/Client_routing.sh
    bash ./Basic_setup.sh
    bash ./Client/RDP_setup.sh
    bash ./time.sh
    clear

    exit
  ;;
    [nN][oO]|[nN])
    break
  ;;
    *)
esac
done

# Client ip (gateway)
while true
do
  read -r -p "Client ip: " cip
  echo ""
  read -r -p "Is this correct: $cip ? [Y/N] " cipq
  case $cipq in
    [yY][eE][sS]|[yY])
    break
  ;;
    *)
  esac
done

# # Conect to client
# while true
# do
#   echo ""
#   read -r -p "Type the Client ip - " cip
#   echo ""
#   echo "client ip - $cip"
#   echo ""
#   read -r -p "Is this right? [Y/N]" ipkeyq
#   case $ipkeyq in
#     [yY][eE][sS]|[yY])
#       break
#   ;;
#     *)
#   esac
# done

echo ""
echo ""
echo -e "\t Copy your RSA key into the text editor"
echo ""
read -n 1 -s -r -p "- Press any key to to open the text editor -"
echo ""

nano ./key.pem
chmod 400 ./key.pem

scp -i ./key.pem -r ./Server-Client-Script/ ubuntu@$cip:/home/ubuntu/

scp -i ./key.pem -r ../Server-Client-Script/ ubuntu@$cip:/home/ubuntu/

whiptail --title "Client Setup!" --msgbox "You will be connected to the client
Login as root and run the script again
(I could've find a way to do this better but I'm too lazy xD)
Choose Ok to continue." 11 65

ssh -i ./key.pem ubuntu@$cip



#scp -i ./key.pem -r ./Server-Client-Script/Client/ ubuntu@$cip:/home/ubuntu/

#scp -i ./key.pem -r ./Client/ ubuntu@$cip:/home/ubuntu/

# ssh -i ./key.pem ubuntu@$cip <<'ENDSSH'
# sudo -u root bash /home/ubuntu/Server-Client-Script/Client/Client_routing.sh
# sudo -u root bash /home/ubuntu/Server-Client-Script/Basic_setup.sh
# sudo -u root bash /home/ubuntu/Server-Client-Script/Client/RDP_setup.sh
# ENDSSH


# echo ""
# echo "Copy and run the following lines"
# echo -e "\t" "Run \"bash ./Client/Client_routing.sh && bash ./Client/RDP_routing.sh\""
# echo ""
# ssh -i ./key.pem ubuntu@$cip


# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/Client_routing.sh
# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Basic_setup.sh
# ssh -i $pkey ubuntu@$cip 'sudo bash -s' < ./Client/RDP_setup.sh


exit
