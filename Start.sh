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

while true
do
  clear
  echo ""
  echo "\t""Ubuntu Setup!"
  echo ""
  echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
  read -r -p "- No fun [1] | Some fun [2] " exe1

  case $exe1 in
    [yY][eE][sS]|[yY])
      bash ./Basic_setup.sh
      exit
  ;;
    [oO][nN][eE]|[yY][eE][sS]|[yY]|[1])
      bash ./Basic_setup.sh
      exit
  ;;
    [tT][wW][oO]|[2])
      bash ./Basic_setup_f.sh
      exit
  ;;
    *)
      bash ./Basic_setup.sh
      exit
  esac
done

#Run in root
if [ "$EUID" -ne 0 ]
  then
    clear
    echo ""
    echo "You must be in root, so let's change pwd"
    echo ""
    sudo passwd
    sudo cp ./c /root/
    echo ""
    echo "Run the script again in root"
    echo ""
    exit
  else
    echo ""
    read -p "New HostName [server]: " hname
    echo ""
    hostname $hname
fi



bash ./Main_Server_Config.sh

bash ./Apache2_setup.sh
