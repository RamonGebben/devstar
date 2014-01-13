function site-archive -a name -d "Archive the website as a timestamped .tar.gz"

    switch "$name"
    case "" 
      crow notice "Usage: site-archive <name>"
    case "*"
      if test -d /cocky/sites/$name 
        crow notice "Backing up website data"
        cd /cocky/sites/$name
        tgz
        mv *.tar.gz /cocky/archive
        cd /cocky/sites
      else
        crow error "Name $name is not a site folder"
        crow notice "Usage: site-archive <name>"
      end
     end

end
