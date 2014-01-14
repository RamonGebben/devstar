function ds-install-gateone -d "Installs gateone web-terminal"
   rm /devstar/source/GateOne -R
   crow notice "Installing python pip support" 
   sudo apt-get -y install python-pip
   crow notice "Cloning GateOne repository into /devstar/source/GateOne"
   mkdir -p /devstar/source
   cd   /devstar/source
   git clone https://github.com/liftoff/GateOne.git
   cd /devstar/source/GateOne
   sudo python setup.py install
   sudo service gateone start
end
