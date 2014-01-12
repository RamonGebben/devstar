function crow -a prio -d "Crow a nicely formatted message"
  switch "$prio"
    case success 
      set_color green
      echo "⊕ $argv[2..-1]"
    case notice
      set_color cyan
      echo "• $argv[2..-1]" 
    case error
      set_color red
      echo "⊗ $argv[2..-1]"
  end  
  set_color normal

end

