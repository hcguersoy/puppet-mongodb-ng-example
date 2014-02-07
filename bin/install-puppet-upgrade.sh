#! /bin/sh

echo "I am installing puppet in a fresh version"

#add puppet repos in a new version
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update

#install newest version of puppet, assume yes in interative mode
sudo apt-get install puppet -y

#clean up
sudo apt-get clean

# write a bit
date > /etc/puppet_installed_at