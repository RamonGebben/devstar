function new-site-emberjs -a name -d "Generate new EmberJS site"
 switch "$name"
  case ""
   crow error "Usage: new-site-emberjs <name>"
  case "*"
   site-file-structure $name 

   crow notice "Generating files"

   cp /devstar/templates/emberjs/index.html /devstar/sites/$name/public
   cp -r /devstar/templates/emberjs/js/* /devstar/sites/$name/public/js
   cp /devstar/templates/css/reset.css /devstar/sites/$name/public/css
   cp /devstar/templates/css/style.css /devstar/sites/$name/public/css

  crow notice "Going into the sites directory"
  cd /devstar/sites/$name
  
  crow success "Site ready"
  
  editor public/js/app.js
 end
end
