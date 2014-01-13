function uncomment -d "Removes comment from folder" 
  touch .comment
  read -p "crow error 'You are about to remove a comment, Are you sure? (y/N)'" aws
   switch "$aws"
    case "y" "Y"
     rm .comment
     crow success "Comment was removed"
    case "n" "N"
     crow notice "Comment was not removed"
  end
end
