function sudo -d "Execute a fish command as root"
  /usr/bin/sudo fish -c "$argv"
end
