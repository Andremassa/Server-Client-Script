#!/bin/bash

# This is a Dumb script to update upgrade and some basic packages :)

clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""

# Fun / No Fun ?
while true
do
  read -r -p "- No fun [1] | Some fun [2] " fun

  case $fun in
    [oO][nN][eE]|[yY][eE][sS]|[yY]|[1])

      # Execute script? (No fun)
      while true
      do
        clear
        echo ""
        echo "\t""Ubuntu Server Setup!"
        echo ""
        echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
        echo ""
        read -r -p "Execute script? [Y/N] " exe1

        case $exe1 in
          [yY][eE][sS]|[yY])
            break
        ;;
          [nN][oO]|[nN])
            echo ""
            echo "Exit"
            sleep 2
            exit
        ;;
          *)
        esac
      done
      clear
      echo ""
      echo "- Let's get serious!"
      echo ""
      sleep 1
      echo ""
      echo "Updating everything..."
      echo ""
      sleep 2
      apt -y update && apt -y upgrade
      sleep 1
      clear
      echo ""
      echo "Installing packages..."
      echo ""
      sleep 2
      apt -y vim git locate tree htop net-tools unzip tasksel fish neofetch
      apt -y update && apt -y upgrade
      echo ""
      echo "All done!!!"
      echo ""
      echo "Goodbye :)"
      sleep 3
      clear
      exit
  ;;
    [tT][wW][oO]|[2])
      echo ""
      echo "Let's gooooo!"
      sleep 1
      break
  ;;
    *)
      echo ""
      echo "Ill assume you would like some fun"
      sleep 1
      break
  ;;
  esac
done

# Execute script?
while true
do
  clear
  echo ""
  echo "\t""Ubuntu Server Setup!"
  echo ""
  echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
  echo ""
  read -r -p "Execute script? [Y/N] " exe2

  case $exe2 in
    [yY][eE][sS]|[yY])
      # Fun
      clear
      echo ""
      echo "\t""Ubuntu Server Setup!"
      echo ""
      echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
      echo ""
      echo "  ⣿⡟⠙⠛⠋⠩⠭⣉⡛⢛⠫⠭⠄⠒⠄⠄⠄⠈⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
      echo "  ⣿⡇⠄⠄⠄⠄⣠⠖⠋⣀⡤⠄⠒⠄⠄⠄⠄⠄⠄⠄⠄⠄⣈⡭⠭⠄⠄⠄⠉⠙"
      echo "  ⣿⡇⠄⠄⢀⣞⣡⠴⠚⠁⠄⠄⢀⠠⠄⠄⠄⠄⠄⠄⠄⠉⠄⠄⠄⠄⠄⠄⠄⠄"
      echo "  ⣿⡇⠄⡴⠁⡜⣵⢗⢀⠄⢠⡔⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄"
      echo "  ⣿⡇⡜⠄⡜⠄⠄⠄⠉⣠⠋⠠⠄⢀⡄⠄⠄⣠⣆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸"
      echo "  ⣿⠸⠄⡼⠄⠄⠄⠄⢰⠁⠄⠄⠄⠈⣀⣠⣬⣭⣛⠄⠁⠄⡄⠄⠄⠄⠄⠄⢀⣿"
      echo "  ⣏⠄⢀⠁⠄⠄⠄⠄⠇⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⡇⠄⠄⡇⠄⠄⠄⠄⢀⣾⣿"
      echo "  ⣿⣸⠈⠄⠄⠰⠾⠴⢾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⣾⢀⠁⠄⠄⠄⢠⢸⣿⣿"
      echo "  ⣿⣿⣆⠄⠆⠄⣦⣶⣦⣌⣿⣿⣿⣿⣷⣋⣀⣈⠙⠛⡛⠌⠄⠄⠄⠄⢸⢸⣿⣿"
      echo "  ⣿⣿⣿⠄⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠈⠄⠄⠄⠄⠄⠈⢸⣿⣿"
      echo "  ⣿⣿⣿⠄⠄⠄⠘⣿⣿⣿⡆⢀⣈⣉⢉⣿⣿⣯⣄⡄⠄⠄⠄⠄⠄⠄⠄⠈⣿⣿"
      echo "  ⣿⣿⡟⡜⠄⠄⠄⠄⠙⠿⣿⣧⣽⣍⣾⣿⠿⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⠃⢿⣿"
      echo "  ⣿⡿⠰⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠩⠔⠒⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⠘⣿"
      echo "  ⣿⠃⠃⠄⠄⠄⠄⠄⠄⣀⢀⠄⠄⡀⡀⢀⣤⣴⣤⣤⣀⣀⠄⠄⠄⠄⠄⠄⠁⢹"
      echo ""
      echo "  Going to work right now!"
      echo ""
      sleep 2
      # Fun
      break
  ;;
    [nN][oO]|[nN])
      # Fun
      clear
      echo
      echo "\t""Ubuntu Server Setup!"
      echo ""
      echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
      echo ""
      echo "  ⣿⣿⣿⣿⠿⢋⣩⣤⣴⣶⣶⣦⣙⣉⣉⣉⣉⣙⡛⢋⣥⣶⣶⣶⣶⣶⣬⡙⢿⣿"
      echo "  ⣿⣿⠟⣡⣶⣿⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠙"
      echo "  ⣿⢋⣼⣿⠟⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢿⣿⣿⣿⣿⣧"
      echo "  ⠃⣾⣯⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⡈⢿⣿⣿⣿⣿"
      echo "  ⢰⣶⣼⣿⣷⣿⣽⠿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⣿⣷⡀⠛⢿⣿⣿"
      echo "  ⢃⣺⣿⣿⣿⢿⠏⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⣿⣿⣿⣷⢹⣿⣷⣄⠄⠈⠉"
      echo "  ⡼⣻⣿⣷⣿⠏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣞⣿⣿⣿⠸⣿⣿⣿⣿⣶⣤"
      echo "  ⣇⣿⡿⣿⠏⣸⣎⣻⣟⣿⣿⣿⢿⣿⣿⣿⣿⠟⣩⣼⢆⠻⣿⡆⣿⣿⣿⣿⣿⣿"
      echo "  ⢸⣿⡿⠋⠈⠉⠄⠉⠻⣽⣿⣿⣯⢿⣿⣿⡻⠋⠉⠄⠈⠑⠊⠃⣿⣿⣿⣿⣿⣿"
      echo "  ⣿⣿⠄⠄⣰⠱⠿⠄⠄⢨⣿⣿⣿⣿⣿⣿⡆⢶⠷⠄⠄⢄⠄⠄⣿⣿⣿⣿⣿⣿"
      echo "  ⣿⣿⠘⣤⣿⡀⣤⣤⣤⢸⣿⣿⣿⣿⣿⣿⡇⢠⣤⣤⡄⣸⣀⡆⣿⣿⣿⣿⣿⣿"
      echo "  ⣿⣿⡀⣿⣿⣷⣌⣉⣡⣾⣿⣿⣿⣿⣿⣿⣿⣌⣛⣋⣴⣿⣿⢣⣿⣿⣿⣿⡟⣿"
      echo "  ⢹⣿⢸⣿⣻⣶⣿⢿⣿⣿⣿⢿⣿⣿⣻⣿⣿⣿⡿⣿⣭⡿⠻⢸⣿⣿⣿⣿⡇⢹"
      echo "  ⠈⣿⡆⠻⣿⣏⣿⣿⣿⣿⣿⡜⣭⣍⢻⣿⣿⣿⣿⣿⣛⣿⠃⣿⣿⣿⣿⡿⠄⣼"
      echo "  ⣦⠘⣿⣄⠊⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣼⣿⣿⣿⡿⠁⠄⠟"
      echo ""
      echo "  I thought we were friends!"
      echo ""
      sleep 3
      # Fun
      exit
  ;;
    *)
    #
  esac
done

# Updating the system
clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
echo "Updating the system..."
echo ""
sleep 2
apt -y update && apt -y upgrade
echo ""
echo "Updating the system - DONE"
sleep 2

# Installing basic packages
clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
echo "Installing packages..."
echo ""
sleep 2
apt -y install bash vim git locate tree cowsay htop net-tools unzip tasksel fish neofetch
snap install lolcat
echo ""
echo "Installing packages - DONE"
sleep 2

# Making sure everything is up to date (by running update/upgrade again xD)
clear
echo ""
echo "\t""Ubuntu Server Setup!" | lolcat -a -d 1 -t
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T") | lolcat -a -d 1 -t
echo ""
echo "Making sure everything is up to date..." | lolcat -a -d 1 -t
echo ""
sleep 2
apt -y update | lolcat -t && apt -y upgrade | lolcat -t
echo ""
echo "- DONE -" | lolcat -t
sleep 2

# All done message
clear
echo ""
echo "\t""Ubuntu Server Setup!" | lolcat -a -d 1 -t
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T") | lolcat -a -d 1 -t
echo ""
echo  "---- // ----""\n" "\n""ALL DONE !!!""\n""\n""---- // ----" | cowthink -f fox | lolcat -a -d 1 -t
echo ""
echo "Wait plz" | lolcat -a -d 1 -t
sleep 2

#
# I want to create alias' and change the default shell
#

# Fun
clear
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠠⠄⠤⠐⠚⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠓⠢⠤⣀⠀⠀⠀"
echo " ⠀⠀⠀⠀⢀⠤⣖⣶⣭⣷⣼⣄⠁⠀⠀⠀⠀⠀⠀⢐⣫⣭⣴⣶⣦⢄⠀⠀⠀⠀"
echo " ⠀⠀⠀⣪⣿⣿⣿⠿⢿⣿⣿⠻⣄⠀⠀⠀⠀⠀⢀⣼⠿⠿⢿⣿⣿⣿⣧⡀⠀⠀"
echo " ⠀⠀⣩⣿⣿⡟⣿⣠⣼⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠁⢸⣤⣼⣿⣿⠻⣿⣿⠀⠀"
echo " ⠀⢀⣿⣿⡟⠀⠹⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⠏⠀⢹⣿⡄⠀"
echo " ⠀⠈⢿⣿⡃⠀⠀⠀⠉⢁⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣀⠈⠀⠀⠀⢰⠟⡇⠀"
echo " ⠀⠀⠀⠉⠗⠖⠀⠊⠉⠉⠁⠀⠀⠀⠀⠀⠀⠰⠀⠀⠈⠙⠛⠒⠀⠐⠆⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣒⣢⣤⣤⣤⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣝⠿⣿⣿⣿⣿⣿⠿⣻⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣈⡭⠭⣭⠴⠚⠁⠀⠀⠀⠀⠀⠀⠀    "
sleep 1
# Fun

clear
echo "xD"
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T") | lolcat -a -d 1 -t # This is a date with a horizontal tab
echo ""
neofetch | lolcat -a -d 1 -t
echo ""
