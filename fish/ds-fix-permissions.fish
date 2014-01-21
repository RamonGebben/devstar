function ds-fix-permissions -d "Fix devstar group permissions"

  sudo chgrp -R devstar /devstar
  sudo chmod -R g+w /devstar
  crow success "Make sure all files /devstar have group devstar and group-permission to write"

end
