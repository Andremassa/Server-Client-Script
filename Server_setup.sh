#!/bin/bash

clear
echo ""
echo  -e "\t""Ubuntu Server Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

# Fun or No Fun?
while true
do
  read -r -p "No Fun [1] | xFunx [2] " fun

  case $fun in
    [oO][nN][eE]|[yY][eE][sS]|[yY]|[1]|[])
      bash ./Basic_setup.sh
      bash ./Server/Server_postrouting.sh
      bash ./Server/Apache2_setup.sh
      bash ./Server/Mysql_setup.sh
      bash ./Server/Php_setup.sh
      bash ./Server/Joomla_setup.sh
      bash ./Server/Moodle_setup.sh
      bash ./Server/RDP_routing.sh
      bash ./Server/Sites_inst.sh
      clear
      # all done message

      exit
  ;;
    [tT][wW][oO]|[2])
      #bash ./Basic_setup_f.sh

      #exit
  ;;
    *)
  esac
done

exit
