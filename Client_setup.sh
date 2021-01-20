#!/bin/bash

# !!!!!! finish

clear
echo ""
echo "\t""Ubuntu Client Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""

#
while true
do
  read -r -p "Is this the client? " cl

  case $cl in
    [yY][eE][sS]|[yY])
    bash ./Client/xxxx

    exit
  ;;
    [nN][oO]|[nN])
    break
  ;;
    *)
esac
done

# Conect to client
echo "Conect to client"
echo ""
read -r -p "Client ip - " cip
echo ""
read -r -p "Locate public key - " pkey
echo ""
while true
do
  read -r -p "Client ip - $cip

  Public key - $pkey

  Is this right? " ipkeyq
  case $ipkeyq in
    [yY][eE][sS]|[yY])
      break
  ;;
    *)
  esac
done

chmod 400 $pkey
ssh -i $pkey ubuntu@$cip 'sudo bash -s' < file

exit
