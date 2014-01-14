function ds-feed -a view -d "Display the comments throughout the tree"

  function showb
    for i in ( cat -s $argv[1] )
      crow detail $i
    end
  end
  
  function showc 
    set_color green  
    crow notice $argv[1] | sed 's/\.[^.]*$//' | sed 's/\/devstar\///g' | sed 's/\/$//g' | sed '/^$/d'
    showb $argv[1]
  end

  switch "$view"
    case ""
      for c in (ls -1 (pwd)**/.comment)
        showc $c
      end    
    case updates
      for c in (ls -1 -t /devstar/**/.comment)[1..3]
        showc $c
      end    
    case latest
      showc (ls -1 -t /devstar/**/.comment)[1]
    case 'all'
      for c in (ls -1 /devstar/**/.comment)[1..3]
        showc $c
      end    
    case 'here'
      if test -e ".comment"
        showb (echo -s (pwd) "/.comment")
      end       
    case '*'
      for c in (ls -1 -t /devstar/**/.comment)        
        showc $c
      end    
  end
  

end
