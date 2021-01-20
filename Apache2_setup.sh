#!/bin/bash

#Run in root
if [ "$EUID" -ne 0 ]
  then
    clear
    echo ""
    echo "You must be in root"
    echo ""
    sudo passwd
    sudo git clone https://github.com/Andremassa/dsfc /root/
    echo ""
    echo "Run the script again in root"
    echo ""
    exit
  else
    #
fi
