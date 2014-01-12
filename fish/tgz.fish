function tgz -a name source -d "Compresses to tar.gz archive"
  switch "$name"
    case ""
     set fn ( echo -s (basename (pwd)) "-" (date +%Y%m%d)  ".tar.gz" )   
     crow notice "Create $fn from all non-archive, non-vcs files in" (pwd)  
     tar -zcvf  $fn  * --exclude="*.tar.gz" --exclude="*.tgz" --exclude="*.bz2" --exclude="*.zip" --exclude-vcs
     crow success "Finished creating $fn"
    case '*'
      switch "$source"
        case ""      
          crow notice "Create $name.tar.gz from all non-archive, non-vcs files in" (pwd)            
          tar -zcvf "$name.tar.gz" * --exclude="*.tar.gz" --exclude="*.tgz" --exclude="*.bz2" --exclude="*.zip" --exclude-vcs
        case '*'      
          set source $argv[2..-1]
          crow notice "Create $name.tar.gz from all non-archive, non-vcs files like $source"             
          tar -zcvf "$name.tar.gz" $source --exclude="*.tar.gz" --exclude="*.tgz" --exclude="*.zip" --exclude="*.bz2" --exclude-vcs
      end 
      crow success "Finished creating $name.tar.gz"
  end
  
end
