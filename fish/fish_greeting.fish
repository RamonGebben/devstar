function fish_greeting
  function g2 
    df -h -x tmpfs -x devtmpfs | sed "s/^/  /"
    cd /devstar/sites  
    du -sh * | sed "s/^/  /"
    ds-help
    ds-env
  end
  clear
  echo 
  toilet " " (hostname) "" -f smblock  -t -F gay
  g2 | more
end
