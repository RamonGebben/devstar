function sudo -d "Execute a command with escalated privileges"
  if test -d /usr/local/rvm
    /usr/bin/sudo fish -c "rvm use ruby-2.1.0 > /dev/null; crow warn 'escalated privileges'; $argv"
  else
    /usr/bin/sudo fish -c "crow warn 'escalated privileges'; $argv"
  end
end
