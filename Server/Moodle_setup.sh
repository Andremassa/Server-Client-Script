#!/bin/bash

clear
echo ""
echo  -e "\t""Moodle Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

# Install Moodle?
while true
do
  read -r -p "Execute script? [Y/N] " exem

  case $exem in
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


mkdir /opt

wget 'https://download.moodle.org/download.php/direct/stable310/moodle-3.10.1.zip'
mv 'moodle-3.10.1.zip' /opt/moodle.zip
unzip /opt/moodle.zip -d /var/www/html

mkdir /var/www/moodledata

chown -R www-data /var/www/moodledata
chmod -R 777 /var/www/moodledata

# chmod -R 777 /var/www/html/moodle
# chmod -R 0755 /var/www/html/moodle # do this after moodle site config

echo '<VirtualHost *:80>
     ServerAdmin admin@your-domain.com
     DocumentRoot /var/www/html/moodle/
     ServerName your-domain.com
     ServerAlias www.your-domain.com

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

     <Directory /var/www/html/moodle/>
            Options FollowSymlinks
            AllowOverride All
            Require all granted
     </Directory>

</VirtualHost>
' > /etc/apache2/sites-available/moodle.conf

a2ensite moodle
a2ensite moodle.conf
a2enmod rewrite

stty -echo
echo ""
read -r -p "Set a pwd for moodle user: " moodlepwd
echo ""
echo ""
stty echo

# Database
echo "Login into MySQL "
mysql -u root -p << EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
create user 'moodle'@'localhost' IDENTIFIED BY '$moodlepwd';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodle'@'localhost';
FLUSH PRIVILEGES;
EOF

service apache2 restart

# Webpage Installation
chmod -R 777 /var/www/html/moodle

whiptail --title "Moodle Installation!" --msgbox "Now head to the moodle page and do the following! 1/3


- Path for moodledata

/var/moodledata

- DataBase Type

Choose: mysqli


Press ok for next page!" 19 70

whiptail --title "Moodle Installation!" --msgbox "Now head to the moodle page and do the following! 2/3


- DataBase Settings

Host server: localhost

Database: moodle

User: moodle

Password: passwd (the password for the user you created)

Tables Prefix: mdl_


Press ok for next page!" 23 70

whiptail --title "Moodle Installation!" --msgbox "Now head to the moodle page and do the following! 3/3


- Navigate, on the moodle webpage, to Site Administration > Server > System Paths

Input the following;

Path to du: /usr/bin/du

Path to apsell: /usr/bin/aspell

Path to dot: /usr/bin/dot

Save Changes


Press ok for next page!" 24 70

chmod -R 0755 /var/www/html/moodle

exit

# On the platform
# Navigate, on the moodle webpage, to Site Administration > Server > System Paths

# Input the following;

# Path to du: /usr/bin/du

# Path to apsell: /usr/bin/aspell

# Path to dot: /usr/bin/dot

# Save Changes
