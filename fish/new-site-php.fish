function new-site-php -a name -d "Makes new PHP site"
  switch "$name"
  case ''
    crow error "Usage: new-php-html <name>"
  case '*'

  site-file-structure $name 

  crow notice "Generating files"

  cp /cocky/templates/php/index.php /cocky/sites/$name/public
  cp /cocky/templates/php/header.php /cocky/sites/$name/public/inc
  cp /cocky/templates/css/reset.css /cocky/sites/$name/public/css
  cp /cocky/templates/css/style.css /cocky/sites/$name/public/css

  crow notice "Going into the sites directory"
  cd /cocky/sites/$name
  
  crow success "Site ready"
  
  editor public/index.php
 end
end
