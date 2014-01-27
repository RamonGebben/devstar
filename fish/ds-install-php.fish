function ds-install-php -d "Install PHP, MySQL and phpMyAdmin"
  
  crow notice "Installing php5 (FPM)"
  sudo apt-get -y install php5-fpm php5 php5-mysql
  sudo rm /etc/php5/fpm/pool.d/www.conf
  sudo ln /devstar/config/www.conf /etc/php5/fpm/pool.d/www.conf
  sudo service php5-fpm restart  

end
