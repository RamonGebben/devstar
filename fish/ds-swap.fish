function ds-swap -a act -d "Turn temporary swapfile on"
  switch "$act"
    case "on"
      sudo dd if=/dev/zero of=/swap bs=1M count=1024
      sudo mkswap /swap
      sudo swapon /swap
      crow success "Swap is turned on"
    case "off"
      sudo swapoff /swap
      sudo rm /swap -r
      crow success "Swap is turned off"
    case ""
      crow notice "Usage: on | off"
    case '*'
      crow error "Usage: on | off"
  end
   
end
