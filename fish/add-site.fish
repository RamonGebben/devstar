function add-site -a gen -a name -d "Adds a new site"
  
  switch "$name"
  case ''

    crow error "Usage: add-site <generator> <name> <lib1> <lib2> .. <libN>"

  case '*'

   switch "$gen"
   case ''

     crow error "Usage: add-site <generator> <name> <lib1> <lib2> .. <libN>"

   case '*'

     eval "new-site-$gen $name"

     for lib in $argv[2..]
       if test -d "/devstar/lib/$lib" then
         cp -R "/devstar/lib/$lib" "/devstar/sites/$name"
       else
         crow error "Library <$lib> not found"
       end
     end

   end

  end

end
