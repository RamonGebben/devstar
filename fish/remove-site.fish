function remove-site -a name -d "Remove website and archive its data"

   switch "$name"
    case ""
      crow error "Usage: remove-site <site-name>"
    case '*'
      if test -d /devstar/sites/$name 
        read -p "crow error 'Are you sure you want to archive and remove this website? (y/N)'" ans
        switch "$ans" 
          case "y" "Y"

           site-archive $name

            crow notice "Removing website folder"
            rm /devstar/sites/$name -R
            rweb

            crow success "Site has been destroyed"
          case "" '*'
            crow notice "Site has not been destroyed"
        end
      end
   end
 

end
