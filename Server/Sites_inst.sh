#!/bin/bash

clear
echo ""
echo  -e "\t""Sites Setup!"
echo ""
echo  -e "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

chmod -R 777 /var/www/html/moodle
chmod -R 777 /var/www/html/joomla
echo "
Go to the browser

-- On Moodle --

- Path for moodledata

/var/moodledata

- DataBase Type

Choose: mysqli

- DataBase Settings

Host server: localhost

Database: moodle

User: moodle

Password: passwd (the password for the user you created)

Tables Prefix: mdl_

- Navigate, on the moodle webpage, to Site Administration > Server > System Paths

Input the following;

Path to du: /usr/bin/du

Path to apsell: /usr/bin/aspell

Path to dot: /usr/bin/dot

Save Changes

-- On Joomla --

- DataBase Type

Choose: mysqli

- DataBase Settings

Host name: localhost

Database: joomladb

User: joomla

Password: passwd (the password for the user you created)

-- Press any key when you're done --
"

chmod -R 0755 /var/www/html/moodle
chmod -R 755 /var/www/html/joomla
