#!/bin/bash
#
# Install the desktop system
#
yum -y groupinstall "Base" "X Window System" "Desktop Platform" "Desktop" "General Purpose Desktop"

# Default x-windows boot
echo "id:5:initdefault:" > /etc/inittab
