function fish_greeting
  function g2 
    echo 
    df -h -x tmpfs -x devtmpfs | sed "s/^/  /"
    echo 
    cd /cocky/sites  
    du -sh * | sed "s/^/  /"
    cocky-help
    cocky-env
  end
  clear
  echo 
  toilet " " (hostname) "" -f smblock  -t -F gay
  echo
  g2 | more
end
