#!/bin/sh 

# fix locale error messages with apt
echo "LANG=\"en_US.UTF-8\"" > /etc/default/locale
echo "LANGUAGE=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LC_BYOBU=1" >> /etc/default/locale  # make byoby system-wide default, if its installed
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales
mkdir /root/.byobu
echo "source /devstar/config/byobu" > /root/.byobu/.tmux.conf

# upgrade to zero-day
apt-get update
apt-get -y upgrade

# add support for ppa
apt-get install -y python-software-properties

# repositories
add-apt-repository -y ppa:keithw/mosh            # mosh
apt-add-repository -y ppa:fish-shell/release-2   # fish
apt-get update

# install it all at once
apt-get -y install mosh byobu fish git toilet fail2ban

# set default group
addgroup devstar
usermod -g devstar root
echo "%devstar   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/devstar
chmod 0440 /etc/sudoers.d/devstar

# checkout devstar
mkdir -p /devstar
cd /devstar
git clone https://github.com/RamonGebben/devstar.git .
mkdir -p /devstar/sites
mkdir -p /devstar/flags

# fix ownership
chown -R root:devstar /devstar 
chown -R root:devstar /devstar

# link fish functions
ln -s /devstar/fish /etc/fish/functions

# fix default umask
sed -i 's/UMASK\s*022/UMASK 002/g' /etc/login.defs

echo "***************************"
echo "REBOOT and run ds-update"
#reboot
