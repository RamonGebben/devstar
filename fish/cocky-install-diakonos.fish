function cocky-install-diakonos -d "Install the diakonos text editor"
  crow notice "Installing depencency 'curses' as gem"
  sudo gem install curses
  mkdir -p /cocky/source/diakonos  
  cd /cocky/source/diakonos
  if test -d .git
    crow notice "Pulling from remote git repository"
    git pull
  else
    crow notice "Cloning from remote git repository"
    git clone https://github.com/Pistos/diakonos.git .
  end
  sudo ruby install.rb
  crow success "Diakonos is installed"
end
