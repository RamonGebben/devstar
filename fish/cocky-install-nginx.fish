function cocky-install-nginx -d "Install nginx webserver from source"


  crow notice "Installing passenger"
  sudo gem install passenger
  sudo apt-get -y install libcurl4-openssl-dev 

  crow notice "Turning swap on"
  cocky-swap on
  
  crow notice "Building en installing nginx" 
  sudo passenger-install-nginx-module --languages ruby,python,nodejs,meteor --auto-download --extra-configure-flags='"--with-http_ssl_module --with-http_mp4_module"' --auto --prefix=/opt

  crow notice "Turning swap off"
  cocky-swap off

  crow notice "Hooking up nginx as a system-wide service"
  sudo cp /cocky/config/nginx.service /etc/init.d/nginx

  crow notice "Installing rails"
  sudo gem install rails


end
