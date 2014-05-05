function get-routes
  cat /devstar/sites/*/config/nginx.conf > /devstar/sites/routes.txt
  more /devstar/sites/*/config/nginx.conf
  crow notice "You can acces this log when you like in /devstar/sites/routes.txt"
end

