#!/bin/bash

clear
echo ""
echo  -e "\t""Ubuntu Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

stty -echo
cd ./Server-Client-Script/
stty echo
echo ""

# Execute Script?
while true
do
  read -r -p "Execute script? [Y/N] " exe1

  case $exe1 in
    [yY][eE][sS]|[yY])
      break
  ;;
    [nN][oO]|[nN])
      sleep 2
      exit
  ;;
    *)
  esac
done

# Run in root
if [ "$EUID" -ne 0 ]
  then
    clear
    echo ""
    echo "You must be as root!"
    echo ""

    # Change passwd
    while true
    do
      read -r -p "Change passwd? [Y/N] " pwdq
      case $pwdq in
        [yY][eE][sS]|[yY])
        echo ""
        sudo passwd
        break
      ;;
        *)
        break
      esac
    done

    echo ""
    echo "Run the script again as root"
    echo ""
    exit
fi

# Client or server?
while true
do
  clear
  echo ""
  echo  -e "\t""Ubuntu Setup!"
  echo ""
  echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
  read -r -p "Configure a Client [1] or Server [2] " sc

  case $sc in
    [oO][nN][eE]|[1])
      bash ./Client_setup.sh
      ###
      exit
  ;;
    [tT][wW][oO]|[2])
      bash ./Server_setup.sh
      bash ./Server/time.sh
      ###
      exit
  ;;
    *)
  esac
done

exit
