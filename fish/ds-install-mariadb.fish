function ds-install-mariadb -d "Installs MariaDB database server"

 sudo "apt-get install python-software-properties"
 sudo "apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db"
 sudo "add-apt-repository 'deb http://mariadb.mirror.triple-it.nl//repo/5.5/ubuntu precise main'"
 sudo cp /devstar/config/mariadb.apt /etc/apt/preferences.d/mariadb
 sudo "apt-get update"
 sudo "apt-get install mariadb-server libmariadbclient-dev"

end
