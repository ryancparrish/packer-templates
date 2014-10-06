#!/bin/bash

if [ "$PACKER_BUILDER_TYPE" = "virtualbox-iso" ]
then

# Install  VirtualBox Guest Additions pre-reqs.
yum -y install gcc make kernel-devel-`uname -r` perl

# Install VirtualBox Guest Additions
mkdir /tmp/guesttools
mount -o loop /root/VBoxGuestAdditions.iso /tmp/guesttools
sh /tmp/guesttools/VBoxLinuxAdditions.run

# Cleanup
umount /tmp/guesttools
rm -rf /tmp/guesttools /root/VBoxGuestAdditions.iso

fi

if [ "$PACKER_BUILDER_TYPE" = "vmware-iso" ]
then

# Install  VMware Tools pre-reqs.
yum -y install perl

# Install VMware Tools
mkdir /tmp/guesttools
mount -o loop /root/linux.iso /tmp/guesttools

mkdir /tmp/vmware
cd /tmp/vmware
cp /tmp/guesttools/VMwareTools-*.gz .
tar -zxvf VMwareTools*.gz
./vmware-tools-distrib/vmware-install.pl -d

# Cleanup
umount /tmp/guesttools
rm -rf /tmp/guesttools /root/linux.iso /tmp/vmware

fi
