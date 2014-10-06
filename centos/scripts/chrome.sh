#!/bin/bash

cd /opt
wget http://chrome.richardlloyd.org.uk/install_chrome.sh
chmod +x install_chrome.sh
./install_chrome.sh -f
rm -f install_chrome.sh

