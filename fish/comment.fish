function comment -a input -d "Edit or add comments to folder"
 touch .comment
  switch "$input"
   case ""
    editor .comment
   case "*" 
    echo -n -s (whoami) >> .comment
    echo -s ": $input" >> .comment
  end
end
