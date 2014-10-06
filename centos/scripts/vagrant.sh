#!/bin/bash

# Timestamp for base box
date > /etc/vagrant_box_build_time

# Setup vagrant user with no-password-required sudoer privileges
groupadd vagrant
useradd vagrant -g vagrant -G wheel
echo "vagrant"|passwd --stdin vagrant
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
echo 'Defaults !secure_path' >> /etc/sudoers.d/vagrant
echo 'Defaults    env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Install vagrant ssh keys
mkdir -pm 700 /home/vagrant/.ssh
wget -q -O /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Install most common provisioners
gem install --no-ri --no-rdoc chef
gem install --no-ri --no-rdoc puppet
