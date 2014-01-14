function ds-upgrade -d "Brings core tools and configuration up to date" 

  crow notice "Ensuring tools, logs & sites folder"
  mkdir -p /devstar/tools
  mkdir -p /devstar/logs
  mkdir -p /devstar/sites
  mkdir -p /devstar/source
  mkdir -p /devstar/fishc

  crow notice "Pull most recent changes from remote git"
  git pull

  crow notice "Install default toolset"
  sudo apt-get -y install htop build-essential zip figlet toilet 

  crow notice "Update fish auto-completitions"
  fish_update_completions 

  crow success "Finished ds-upgrade proccess"

end
