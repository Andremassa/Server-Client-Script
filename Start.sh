#!/bin/bash

clear
echo ""
echo "\t""Ubuntu Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

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

    # Change HostName
    while true
    do
      read -r -p "Change HostName? [Y/N] " hname

      case $hname in
        [yY][eE][sS]|[yY])
        echo ""
        read -p "New HostName [server]: " hname
        hostname $hname
        break
      ;;
        *)
        break
      esac
    done

    git clone https://github.com/Andremassa/dsfc.git /root/
    echo ""
    echo "Run the script again as root"
    echo ""
    exit
  else
    #
fi

# Client or server?
while true
do
  clear
  echo ""
  echo "\t""Ubuntu Setup!"
  echo ""
  echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
  read -r -p "Is this Client [1] or Server [2] " sc

  case $sc in
    [oO][nN][eE]|[1])
      bash ./Server_setup.sh
      ###
      exit
  ;;
    [tT][wW][oO]|[2])
      bash ./Client_setup.sh
      ###
      exit
  ;;
    *)
  esac
done

exit
