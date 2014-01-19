function ds-install-rvm -d "Installs Ruby Version Management"  
  curl -sSL https://get.rvm.io | sudo bash -s stable
  sudo chmod -R g+w /usr/local/rvm
  rvm install ruby-2.1.0  
end
