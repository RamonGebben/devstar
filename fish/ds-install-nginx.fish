function ds-install-nginx -d "Install nginx webserver from source"


  crow notice "Installing passenger"
  gem install passenger
  sudo apt-get -y install libcurl4-openssl-dev 

  crow notice "Turning swap on"
  ds-swap on
  
  crow notice "Building en installing nginx" 
  sudo passenger-install-nginx-module --languages ruby,python,nodejs,meteor --auto-download --extra-configure-flags='"--with-http_ssl_module --with-http_mp4_module"' --auto --prefix=/opt/nginx

  crow notice "Turning swap off"
  ds-swap off

  crow notice "Hooking up nginx as a system-wide service"
  sudo cp /devstar/config/nginx.service /etc/init.d/nginx

  sudo rm -r /opt/nginx/conf
  sudo ln -s /devstar/config/nginx /opt/nginx/conf

  crow notice "Installing rails"
  gem install rails

  crow notice "Adding to update-rc.d"
  update-rc.d nginx defaults

end
