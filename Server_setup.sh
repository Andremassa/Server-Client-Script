#!/bin/bash

# Fun or No Fun?
while true
do
  clear
  echo ""
  echo "\t""Ubuntu Setup!"
  echo ""
  echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
  read -r -p "No Fun [1] | Fun [2] " fun

  case $fun in
    [oO][nN][eE]|[yY][eE][sS]|[yY]|[1]|[])
      bash ./Basic_setup.sh

  ;;
    [tT][wW][oO]|[2])
      bash ./Basic_setup_f.sh

  ;;
    *)
  esac
done
