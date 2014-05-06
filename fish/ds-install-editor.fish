function ds-install-editor -d "Install DevStar Editor"
    cd /devstar/sites/
    git clone ssh://devstar.ra-ge.net/devstar/sites/editor
    chmod -R g+w editor
    cd /devstar/sites/editor/
    bundle install
    rake db:migrate
    rake db:data:load_dir
    rweb
end 
