#!/bin/bash

clear
echo ""
echo  -e "\t""RDP Routing Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 3389 -j DNAT --to-destination 172.31.144.101

netfilter-persistent save

exit

####### destination ip ### ask
