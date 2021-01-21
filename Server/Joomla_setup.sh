#!/bin/bash

clear
echo ""
echo  -e "\t""Joomla Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install php-xml php-zip

mkdir /opt

wget 'https://downloads.joomla.org/cms/joomla3/3-9-24/Joomla_3-9-24-Stable-Full_Package.zip?format=zip'
mv 'Joomla_3-9-24-Stable-Full_Package.zip?format=zip' /opt/joomla.zip
unzip /opt/joomla.zip -d /var/www/html/joomla

sudo chown -R www-data:www-data /var/www/html/joomla
sudo chmod -R 755 /var/www/html/joomla

echo '<VirtualHost *:80>
     ServerAdmin admin@your-domain.com
     DocumentRoot /var/www/html/joomla/
     ServerName your-domain.com
     ServerAlias www.your-domain.com

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

     <Directory /var/www/html/joomla/>
            Options FollowSymlinks
            AllowOverride All
            Require all granted
     </Directory>

</VirtualHost>
' > /etc/apache2/sites-available/joomla.conf

a2ensite joomla
a2ensite joomla.conf
a2enmod rewrite

stty -echo
echo ""
read -r -p "Chose the pwd for joomla user: " pwd
echo ""
echo ""
stty echo

# Database
mysql -u root --password=$pwd << EOF
CREATE DATABASE joomladb;
create user 'joomla'@'localhost' IDENTIFIED BY '$pwd';
GRANT ALL PRIVILEGES ON joomladb.* TO 'joomla'@'localhost' IDENTIFIED BY '$pwd';
FLUSH PRIVILEGES;
EOF

systemctl restart apache2

exit
