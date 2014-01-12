function site-file-structure -a name -d "Generates file default file structure"
  switch "$name"
   case ""
    crow error "File structure missing site name"
   case "*"

  crow notice "Setting up file structure"
  
  mkdir -p /cocky/sites/$name/db
  mkdir -p /cocky/sites/$name/log
  mkdir -p /cocky/sites/$name/config
  mkdir -p /cocky/sites/$name/public
  mkdir -p /cocky/sites/$name/public/js  
  mkdir -p /cocky/sites/$name/public/css
  mkdir -p /cocky/sites/$name/public/inc
  mkdir -p /cocky/sites/$name/public/img  

 end
end