function cocky-install-wiki -d "Fetch wiki-docs from github"
   mkdir -p /cocky/wiki
   cd /cocky/wiki
   git clone https://github.com/RamonGebben/cocky.wiki.git . 
end
