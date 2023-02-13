#!/bin/bash

# DB specific
mysql -e "DROP DATABASE IF EXISTS sandbox;"
mysql -e "DROP DATABASE IF EXISTS settings_sandbox;"
mysql -e "DROP DATABASE IF EXISTS tmp_global;"
mysql -e "DROP USER IF EXISTS sandboxuser@localhost;"
mysql -e "DROP USER IF EXISTS globaluser@localhost;"
#
mysql -e "CREATE DATABASE sandbox;"
mysql -e "CREATE DATABASE settings_sandbox;"
mysql -e "CREATE DATABASE tmp_global;"
mysql -e "GRANT ALL PRIVILEGES ON sandbox.* TO 'sandboxuser'@'%' IDENTIFIED BY 'Tqs9z/xAqLpmYqiRb4{A';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'globaluser'@'%' IDENTIFIED BY 'dYJ+c&iGD1=Arg8B3Y\$1';"
mysql -e "FLUSH PRIVILEGES;"
