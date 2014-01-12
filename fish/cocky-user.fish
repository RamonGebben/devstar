function cocky-user -a name -d "Adds a user to this system"
  switch "$name"
    case ''
      crow error "Usage: cocky-user <username>"
    case '*'      

      crow notice "Adding user to system"
      sudo adduser $name

      crow notice "Setting default group to 'cocky'"
      sudo usermod -g cocky $name  
 
      crow notice "Hooking up byobu config"      
      sudo mkdir "/home/$name/.byobu"
      sudo touch "/home/$name/.byobu/.tmux.conf"
      sudo chmod 777 "/home/$name/.byobu"
      sudo chmod 777 "/home/$name/.byobu/.tmux.conf"
      echo "source /cocky/config/byobu" > "/home/$name/.byobu/.tmux.conf" 
      sudo chown -R $name:cocky "/home/$name/.byobu"
      sudo chmod 700 "/home/$name/.byobu"
      sudo chmod 700 "/home/$name/.byobu/.tmux.conf"

      crow success "User $name succesfully added"

  end
end
