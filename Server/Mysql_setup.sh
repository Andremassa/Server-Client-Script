#!/bin/bash

clear
echo ""
echo  -e "\t""MySQL Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install mysql-server

stty -echo
echo ""
read -r -p "Chose a pwd for root MySQL: " mysqlpwd
echo ""
echo ""
stty echo

echo ""
mysql -u root -password=$mysqlpwd << EOF
ALTER user 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '$mysqlpwd';
FLUSH PRIVILEGES;
EOF

systemctl restar apache2

exit

#mysql -u root --password=$pwd << EOF
#FLUSH PRIVILEGES;
#EOF
