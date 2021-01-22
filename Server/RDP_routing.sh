#!/bin/bash

clear
echo ""
echo  -e "\t""RDP Routing Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

# Client ip
while true
do
  read -p "Client ip: " cip
  echo ""
  read -r -p "Is this correct: $cip ? [Y/N] " cipq
  case $cipq in
    [yY][eE][sS]|[yY])
    break
  ;;
    *)
  esac
done

iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 3389 -j DNAT --to-destination $cip

netfilter-persistent save

exit
