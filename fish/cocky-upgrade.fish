function cocky-upgrade

  # verify default folders
  mkdir -p /cocky/tools
  mkdir -p /cocky/logs
  mkdir -p /cocky/sites

  # fetch most recent configuration
  git pull

  # install default toolset
  sudo apt-get -y install htop build-essential zip figlet toilet 

end
