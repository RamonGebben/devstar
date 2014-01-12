function fish_greeting
  clear
  echo 
  #toilet "" (hostname) "" -f smmono9  -F border -t -F gay
  toilet " " (hostname) "" -f smblock  -t -F gay
  echo 
  df -h -x tmpfs -x devtmpfs | sed "s/^/  /"
  echo 
  cd /cocky/sites
  du -sh * | sed "s/^/  /"
  cocky-help
  cocky-env
  cocky-feed latest
end
