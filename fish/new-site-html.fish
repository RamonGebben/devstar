function new-site-html -a name -d "Makes new HTML site"
  switch "$name"
  case ''
    crow error "Usage: new-site-html <name>"
  case '*'

  site-file-structure $name

  crow notice "Generating files"
  cp /cocky/templates/html/index.html /cocky/sites/$name/public
  cp /cocky/templates/css/reset.css /cocky/sites/$name/public/css
  cp /cocky/templates/css/style.css /cocky/sites/$name/public/css
  cd /cocky/sites/$name
  
  crow success "Site ready"
  
  editor public/index.html
 end
end
