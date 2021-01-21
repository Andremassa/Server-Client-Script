#!/bin/bash

clear
echo ""
echo  -e "\t""Moodle Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

mkdir /opt

wget 'https://download.moodle.org/download.php/direct/stable310/moodle-3.10.1.zip'
mv 'moodle-3.10.1.zip' /opt/moodle.zip
unzip /opt/moodle.zip -d /var/www/html

mkdir /var/www/moodledata

chown -R www-data /var/www/moodledata

chmod -R 777 /var/www/moodledata

chmod -R 0755 /var/www/html/moodle

stty -echo
echo ""
read -r -p "Chose the pwd for moodle user: " pwd
echo ""
echo ""
stty echo

# Database
mysql -u root --password=$pwd << EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
create user 'moodle'@'localhost' IDENTIFIED BY '$pwd';
GRANT ALL PRIVILEGES ON moodle.* TO 'moodle'@'localhost' IDENTIFIED BY '$pwd';
FLUSH PRIVILEGES;
EOF

service apache2 restart

exit
