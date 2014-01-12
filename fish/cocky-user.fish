function cocky-user -a name -d "Adds a user to this system"
  switch "$name"
    case ''
      set_color red
      echo "Usage: cocky-user <username>"
    case '*'      
      sudo adduser $name
      sudo usermod -g cocky ramon      
      sudo mkdir "/home/$name/.byobu"
      echo "source /cocky/config/byobu" > "/home/$name/.byobu/.tmux.conf" 
      sudo chown -R $name:cocky "/home/$name/.byobu"
  end
end
