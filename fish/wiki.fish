function wiki -a topic -d "view selected wiki topics"

  switch "$topic"
  case ""
 
    echo
    set_color -b 222 d91161
    echo -s "Wiki documents"

    for t in /devstar/wiki/*.md
      echo
      set_color -b normal yellow
      echo -n -s '  » '
      set_color blue
      echo -n -s "wiki "
      set_color green
      echo -n -s (basename $t ".md")
    end

    echo
    echo

  case '*'

    if test -e /devstar/wiki/$topic.md 
      mad /devstar/wiki/$topic.md
    else
      crow error "$topic does not exist"
      wiki
    end

  end


end
  
