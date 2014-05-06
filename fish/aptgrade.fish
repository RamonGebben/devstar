function aptgrade -d "Update & upgrade apt"
  sudo apt-get update
  sudo apt-get -y upgrade
  crow notice "apt-get has being updated"
end
