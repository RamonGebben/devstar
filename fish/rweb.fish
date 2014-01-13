function rweb
  sudo service nginx stop
  sudo service nginx start
  crow success "Nginx has been restarted"
end
