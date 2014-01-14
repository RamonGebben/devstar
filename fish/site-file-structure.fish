function site-file-structure -a name -d "Generates file default file structure"
  switch "$name"
   case ""
    crow error "File structure missing site name"
   case "*"

  crow notice "Setting up file structure"
  
  mkdir -p /devstar/sites/$name/db
  mkdir -p /devstar/sites/$name/log
  mkdir -p /devstar/sites/$name/config
  mkdir -p /devstar/sites/$name/public
  mkdir -p /devstar/sites/$name/public/js  
  mkdir -p /devstar/sites/$name/public/css
  mkdir -p /devstar/sites/$name/public/inc
  mkdir -p /devstar/sites/$name/public/img  

 end
end