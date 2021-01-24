#!/bin/bash

clear
echo ""
echo  -e "\t""Remote Client Routing Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

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

sed -i "14i\            routes:\n            - to: 0.0.0.0/0\n              via: $sip" /etc/netplan/50-cloud-init.yaml

netplan try

exit" > ./remote_cr.sh

scp -i ./key.pem -r ../Client ubuntu@$cip:/home/ubuntu/

ssh -i ../key.pem ubuntu@$cip 'sudo bash -s' < ./remote_cr.sh

ssh -i ../key.pem ubuntu@$cip 'sudo bash -s' < ./RDP_setup.sh
