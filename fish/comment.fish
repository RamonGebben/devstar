function comment -a input -d "Edit or add comments to folder"
 touch .comment
  switch "$input"
   case ""
    editor .comment
   case "*" 
    echo "$input" >> .comment
  end
end