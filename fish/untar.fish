function untar -a name destination -d "Extract tar.gz or tar.bz or zip archive"
  switch "$name"
    case ""
      for fn in *.tar.gz
        untar $fn
      end
      for fn in *.tgz
        untar $fn
      end
      for fn in *.tar.bz2
        untar $fn
      end
      for fn in *.zip
        untar $fn
      end
    case '*'
      switch "$destination"
        case ""       
          set hname ($name  | sed 's/\.[^\.]*$//g'  | sed 's/\.[^\.]*$//g'
          mkdir -p $hname
          tar --preserve-permissions --preserve-order --overwrite --directory $hname -xvf "$name"           
        case '*'      
          mkdir -p $destination
          tar --preserve-permissions --preserve-order --overwrite --directory $destination -xvf "$name"  
        end
      end
  end
end
