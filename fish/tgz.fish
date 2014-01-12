function tgz -a name source -d "Compresses to tar.gz archive"
  switch "$name"
    case ""
     tar -zcvf  ( echo -s (basename (pwd)) "-" (date +%Y%m%d)  ".tar.gz" )  * --exclude="*.tar.gz" --exclude="*.tgz" --exclude-vcs
    case '*'
      switch "$source"
        case ""      
          tar -zcvf "$name.tar.gz" * --exclude="*.tar.gz" --exclude="*.tgz" --exclude-vcs
        case '*'
          tar -zcvf "$name.tar.gz" "$source" --exclude="*.tar.gz" --exclude="*.tgz" --exclude-vcs
      end 
  end
end
