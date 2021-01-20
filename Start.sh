#!/bin/bash

# Execute Script?
while true
do
  clear
  echo ""
  echo "\t""Ubuntu Setup!"
  echo ""
  echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
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
    echo "You must be in root, so let's change pwd"
    echo ""

    # Change passwd
    while true
    do
      read -r -p "Change passwd? " pwdq

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
      read -r -p "Change HostName? " hname

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

    sudo cp ./c /root/
    echo ""
    echo "Run the script again in root"
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
  read -r -p "Client [1] | Server [2] " sc

  case $sc in
    [oO][nN][eE]|[1])
      bash ./Server_setup.sh
      ###
  ;;
    [tT][wW][oO]|[2])
      bash ./Client_setup.sh
      ###
  ;;
    *)
  esac
done
