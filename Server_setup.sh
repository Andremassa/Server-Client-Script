#!/bin/bash

clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""

# Fun or No Fun?
while true
do
  read -r -p "No Fun [1] | Fun [2] " fun

  case $fun in
    [oO][nN][eE]|[yY][eE][sS]|[yY]|[1]|[])
      bash ./Basic_setup.sh
      bash ./Server/Apache2_setup.sh

      exit
  ;;
    [tT][wW][oO]|[2])
      bash ./Basic_setup_f.sh

      exit
  ;;
    *)
  esac
done

exit
