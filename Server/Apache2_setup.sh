#!/bin/bash

clear
echo ""
echo  -e "\t""Apache2 Server Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install apache2

a2enmod ssl
a2ensite default-ssl.conf

# doesnt WORK!!!!! # sed -i.bak 's/DocumentRoot /var/www/html/DocumentRoot /var/www/htmls/g' /etc/apache2/sites-available/default-ssl.conf
nano /etc/apache2/sites-available/default-ssl.conf

mkdir /var/www/htmls

#echo "this is htmls port 443" > /var/www/htmls/index.html

cp /var/www/html/index.html /var/www/html/index.html.bak

#echo "this is html port 80" > /var/www/html/index.html

# edit index.html

systemctl restart apache2

exit
