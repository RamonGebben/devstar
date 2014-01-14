function ds-help -d "Show important keyboard shortcuts & wiki topics"

  function showkey 
    set_color  444
    echo -n -s $argv[3]
    set_color -b 444 yellow
    echo -n -s "$argv[2]"
    set_color -b normal cyan
    echo -n -s " $argv[1]"
  end

  echo 

  set_color -b 222 d91161
  echo -s "Keyboard shortcuts"
  echo 

  set_color -b normal green  
  echo -n -s "  BUFFERS                 SPLITSCREEN               SCROLLING"

  echo
  echo

  showkey "New            " F2 "  "
  showkey "Horizontal     " F2 "shift "
  showkey "" pageDown "    alt " 

  echo
  echo -n "                   "    

  showkey "Vertical       " F2 "  ctrl "
  showkey "" pageUp "    alt " 

  echo 
  echo 

  showkey "Prev           " F3 "  "
  showkey "Prev           " F3 "shift "

  echo

  showkey "Next           " F4 "  "
  showkey "Next           " F4 "shift "

  echo 
  echo

  showkey "Close          " F6 "  "

  echo 

  showkey "Rename         " F8 "  "

  echo
  echo

  wiki

  if test -e "/devstar/flags/first-user" 
  else
    set_color -b 222 d91161
    echo -s "First-usage"
    echo 
    if test -e "/devstar/flags/first-upgrade" 
      crow notice "Perform initial upgrade: ds-upgrade"
    else
      crow notice "Create a first user: ds-user <login>"
    end    
    
  end

end
