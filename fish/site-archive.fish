function site-archive -a name -d "Archive the website as a timestamped .tar.gz"

    switch "$name"
    case "" 
      crow notice "Usage: site-archive <name>"
    case "*"
      if test -d /devstar/sites/$name 
        crow notice "Backing up website data"
        cd /devstar/sites/$name
        tgz
        mv *.tar.gz /devstar/archive
        cd /devstar/sites
      else
        crow error "Name $name is not a site folder"
        crow notice "Usage: site-archive <name>"
      end
     end

end
