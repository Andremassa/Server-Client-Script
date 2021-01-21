#!/bin/bash

clear
echo ""
echo "\t""Client Routing Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

# Server ip (gateway)
while true
do
  read -p "Server (gateway) ip: " sip
  echo ""
  read -r -p "Is this correct: $sip ? [Y/N] " sipq
  case $sipq in
    [yY][eE][sS]|[yY])
    break
  ;;
    *)
  esac
done

cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

nano /etc/netplan/50-cloud-init.yaml

netplan try

exit

# later


#sed -i.bak "s/set-name: eth0/set-name: eth0
#routes:
#- to: 0.0.0.0/0
#  via: $sip /g" ./50-cloud-init.yaml

# ill do it later

#sed '13a\
#            set-name: eth0
#            routes:
#            - to: 0.0.0.0/0
#              via: $sip' > 50-cloud-init.yaml
