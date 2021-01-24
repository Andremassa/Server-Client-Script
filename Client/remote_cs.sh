#!/bin/bash

clear
echo ""
echo  -e "\t""Remote Client Routing Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3


PET=$(whiptail --title "Test Free-form Input Box" --inputbox "What is your pet's name?" 10 60 Wigglebutt 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your pet name is:" $PET
else
    echo "You chose Cancel."
fi



# Server ip (gateway)
while true
do
  read -r -p "Server (gateway) ip: " sip
  echo ""
  read -r -p "Is this correct: $sip ? [Y/N] " sipq
  case $sipq in
    [yY][eE][sS]|[yY])
    break
  ;;
    *)
  esac
done

# Client ip
while true
do
  echo ""
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

echo "#!/bin/bash

cp /etc/netplan/50-cloud-init.yaml.bak /etc/netplan/50-cloud-init.yaml

cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

sed -i '14i\            routes:\n            - to: 0.0.0.0/0\n              via: $sip' /etc/netplan/50-cloud-init.yaml

netplan try

exit" > ./Client/remote_cr.sh

scp -i ./key.pem -r ./Client ubuntu@$cip:/home/ubuntu/

scp -i ./key.pem -r ./Basic_setup.sh ubuntu@$cip:/home/ubuntu/Client


ssh -t -i ./key.pem ubuntu@$cip sudo bash /home/ubuntu/Client/Basic_setup.sh
ssh -t -i ./key.pem ubuntu@$cip sudo bash /home/ubuntu/Client/remote_cr.sh
ssh -t -i ./key.pem ubuntu@$cip sudo bash /home/ubuntu/Client/RDP_setup.sh

# ssh -i ./key.pem ubuntu@$cip <<'ENDSSH'
# sudo -u root bash /home/ubuntu/Client/remote_cr.sh
# sudo -u root bash /home/ubuntu/Client/RDP_setup.sh
# ENDSSH

# ssh -i ./key.pem ubuntu@$cip 'sudo bash -s' < ./Client/remote_cr.sh

# ssh -i ./key.pem ubuntu@$cip 'sudo bash -s' < ./Client/RDP_setup.sh
