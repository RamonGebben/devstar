function untgz -a name destination -d "Extract tar.gz or tar.bz or zip archive"
  switch "$name"
    case ""
      for fn in *.tar.gz
        untgz $fn
      end
      for fn in *.tgz
        untgz $fn
      end
      for fn in *.tar.bz2
        untgz $fn
      end
      for fn in *.zip
        untgz $fn
      end
    case '*'
      switch "$destination"
        case ""       
          set hname (echo $name  | sed 's/\.[^\.]*$//g'  | sed 's/\.[^\.]*$//g')
          mkdir -p $hname
          tar --preserve-permissions --preserve-order --overwrite --directory $hname -xvf "$name"           
        case '*'      
          mkdir -p $destination
          tar --preserve-permissions --preserve-order --overwrite --directory $destination -xvf "$name"  
      end
  end
end
