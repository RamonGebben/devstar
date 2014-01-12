function sudo -d "Execute a command with escalated privileges"
  /usr/bin/sudo fish -c "rvm use > /dev/null; crow warn 'escalated privileges'; $argv"
end
