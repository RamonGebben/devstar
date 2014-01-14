function ds-install-wiki -d "Fetch wiki-docs from github"
   crow notice "Setting up wiki folder at /devstar/wiki"
   mkdir -p /devstar/wiki
   cd /devstar/wiki
   if test -d ".git"
     crow notice "Pulling changes of the wiki from github"
     git pull
   else
     crow notice "Cloning wiki from github"
     git clone https://github.com/RamonGebben/devstar.wiki.git . 
   end
   mkdir -p /devstar/source/mad
   cd /devstar/source/mad
   if test -d ".git" 
     crow notice "Pulling changes of mad from github"
     git pull
   else
     crow notice "Cloning mad (markdown document viewer) from github"
     git clone https://github.com/visionmedia/mad.git .
   end
   crow notice "Installing mad (markdown document viewer)"
   sudo make install
   crow success "Wiki is ready! Usage: wiki <title>"
   cd /devstar
end
