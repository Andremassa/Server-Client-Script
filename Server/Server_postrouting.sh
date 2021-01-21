#!/bin/bash

clear
echo ""
echo "\t""Postrouting Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

sed -i '/#net.ipv4.ip_forward=1/s/^#//g' /etc/sysctl.conf
sysctl -p

apt -y install netfilter-persistent iptables-persistent

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

netfilter-persistent save

exit
