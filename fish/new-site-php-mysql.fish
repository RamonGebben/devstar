function new-site-php-mysql -a name -d "Makes new PHP site with mysql"
  switch "$name"
  case ''
    crow notice "Usage: new-site-php-mysql <name>"
  case '*'

    new-site-php $name
    crow notice "Creating database $name_dev and $name_prod"
    mysqladmin -uroot -p"shift123!@#" create "$name_dev"
    mysqladmin -uroot -p"shift123!@#" create "$name_prod"
    skeletons phpmysql

 end
end
