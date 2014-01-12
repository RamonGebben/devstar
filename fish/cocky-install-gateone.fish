function cocky-install-gateone -d "Installs gateone web-terminal"
   rm /cocky/source/GateOne -R
   crow notice "Installing python pip support" 
   sudo apt-get -y install python-pip
   crow notice "Cloning GateOne repository into /cocky/source/GateOne"
   mkdir -p /cocky/source
   cd   /cocky/source
   git clone https://github.com/liftoff/GateOne.git
   cd /cocky/source/GateOne
   sudo python setup.py install
   sudo service gateone start
end
