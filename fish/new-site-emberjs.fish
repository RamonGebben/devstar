function new-site-emberjs -a name -d "Generate new EmberJS site"
 switch "$name"
  case ""
   crow error "Usage: new-site-emberjs <name>"
  case "*"
   site-file-structure $name 

   crow notice "Generating files"

   cp /cocky/templates/emberjs/index.html /cocky/sites/$name/public
   cp -r /cocky/templates/emberjs/js/* /cocky/sites/$name/public/js
   cp /cocky/templates/css/reset.css /cocky/sites/$name/public/css
   cp /cocky/templates/css/style.css /cocky/sites/$name/public/css

  crow notice "Going into the sites directory"
  cd /cocky/sites/$name
  
  crow success "Site ready"
  
  editor public/js/app.js
 end
end
