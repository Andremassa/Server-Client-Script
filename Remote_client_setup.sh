#!/bin/bash

clear
echo ""
echo  -e "\t""Remote Client Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3


# Server ip (gateway)
sip=$(whiptail --title "Server IP" --inputbox "Type the IP of the server to route all trafic" 10 60 3>&1 1>&2 2>&3)

if (whiptail --title "WARNING!" --yesno "Imputing the wrong ip will make the client unreachable!

Is this the correct ip? - $sip" 10 60) then
    echo ""
else
    echo ""
    exit
fi
echo ""

cip=$(whiptail --title "Client IP" --inputbox "Type the IP of the client you want to configure" 10 60 3>&1 1>&2 2>&3)

# # Server ip (gateway)
# while true
# do
#   read -r -p "Server (gateway) ip: " sip
#   echo ""
#   read -r -p "Is this correct: $sip ? [Y/N] " sipq
#   case $sipq in
#     [yY][eE][sS]|[yY])
#     break
#   ;;
#     *)
#   esac
# done

# Client ip
# while true
# do
#   read -r -p "Client ip: " cip
#   echo ""
#   read -r -p "Is this correct: $cip ? [Y/N] " cipq
#   case $cipq in
#     [yY][eE][sS]|[yY])
#     break
#   ;;
#     *)
#   esac
# done

echo "#!/bin/bash

cp /etc/netplan/50-cloud-init.yaml.bak /etc/netplan/50-cloud-init.yaml

cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

sed -i '14i\            routes:\n            - to: 0.0.0.0/0\n              via: $sip' /etc/netplan/50-cloud-init.yaml

netplan apply

exit" > ./Client/remote_cr.sh

scp -i ./key.pem -r ./Client ubuntu@$cip:/home/ubuntu/

scp -i ./key.pem -r ./Basic_setup.sh ubuntu@$cip:/home/ubuntu/Client

ssh -t -i ./key.pem ubuntu@$cip sudo bash /home/ubuntu/Client/remote_cr.sh

ssh -t -i ./key.pem ubuntu@$cip sudo bash /home/ubuntu/Client/Basic_setup.sh

ssh -t -i ./key.pem ubuntu@$cip bash /home/ubuntu/Client/RDP_setup.sh

exit
