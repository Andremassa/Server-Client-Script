#!/bin/bash

clear
echo ""
echo "\t""MySQL Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install mysql-server

stty -echo
read -r -p "Chose the pwd for root MySQL: " pwd
echo ""
stty echo

mysql -u root -p << EOF
ALTER user 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '$pwd';
FLUSH PRIVILEGES;
EOF

systemctl restar apache2

exit

#mysql -u root --password=$pwd << EOF
#FLUSH PRIVILEGES;
#EOF
