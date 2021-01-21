#!/bin/bash

clear
echo ""
echo "\t""Php Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 3

apt -y install php libapache2-mod-php php-mysql phpmyadmin php-mbstring

phpenmod mbstring

echo '<?php
phpinfo();
?>
' > /var/www/html/info.php

systemctl restart apache2

#echo ""
#read -n 1 -s -r -p "Press any key to continue" # the phpmyadmin page for the datebases

exit
