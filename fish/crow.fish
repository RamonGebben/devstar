function crow -a prio msg -d "Crow a nicely formatted message"
  switch "$prio"
    case success 
      set_color green
      echo "⊕ $msg"
    case detail
      set_color 555
      echo "# $msg"
    case warn
      set_color yellow
      echo "! $msg"
    case notice
      set_color cyan
      echo "• $msg" 
    case error
      set_color red
      echo "⊗ $msg"
  end  
  set_color normal
  if test -e /usr/bin/notify-send 
    switch "$prio"
      case success 
        notify-send "$msg"
      case error
        notify-send "$msg"        
    end    
  end

end

