function get-routes
  touch /devstar/routes.md
  cat /dev/null > /devstar/routes.md

  echo "# Development"  >> /devstar/routes.md
  cat /devstar/sites/*/config/nginx.conf >> /devstar/routes.md

  echo "# Production" >> /devstar/routes.md
  cat /devstar/production/*/config/production.conf >> /devstar/routes.md
  crow notice "Updated routes.md"

  echo "# Development"
  more /devstar/sites/*/config/nginx.conf 
  echo "# Production"
  more /devstar/production/*/config/production.conf 
  crow notice "You can acces this log when you like in /devstar/routes.md"
end

