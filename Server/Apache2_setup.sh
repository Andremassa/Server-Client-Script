#!/bin/bash

clear
echo ""
echo "\t""Apache2 Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""

apt -y install apache2

a2enmod ssl
a2ensite default-ssl.conf

# doesnt WORK!!!!! # sed -i.bak 's/DocumentRoot /var/www/html/DocumentRoot /var/www/htmls/g' /etc/apache2/sites-available/default-ssl.conf
nano /etc/apache2/sites-available/default-ssl.conf

mkdir /var/www/htmls

# edit index.html

systemctl restart apache2
