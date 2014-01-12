function cocky-env -d "Display current environment"

  echo
  set_color -b 222 d91161
  echo -s "Environment"
  set_color -b normal
  echo

  crow notice (rvm use) | sed "s/^/  /"
  echo

end
