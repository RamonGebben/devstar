function cocky-feed -a view -d "Display the comments throughout the tree"
  
  function showc 
    set_color green  
    crow notice $argv[1] | sed 's/\.[^.]*$//' | sed 's/\/cocky\///g' | sed 's/\/$//g'
    for i in ( cat -s $argv[1] )
      crow detail $i
    end
  end

  switch "$view"
    case ""
      for c in (ls -1 (pwd)**/.comment)
        showc $c
      end    
    case updates
      for c in (ls -1 -t /cocky/**/.comment)[1..3]
        showc $c
      end    
    case latest
      showc (ls -1 -t /cocky/**/.comment)[1]
    case 'all'
      for c in (ls -1 /cocky/**/.comment)[1..3]
        showc $c
      end    
    case '*'
      for c in (ls -1 -t /cocky/**/.comment)        
        showc $c
      end    
  end
  

end
