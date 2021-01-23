#!/bin/bash

clear
echo ""
echo  -e "\t""Client Routing Setup!"
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

cp /etc/netplan/50-cloud-init.yaml.bak /etc/netplan/50-cloud-init.yaml

cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

sed -i "14i\            routes:\n            - to: 0.0.0.0/0\n              via: $sip" /etc/netplan/50-cloud-init.yaml

netplan try

exit
