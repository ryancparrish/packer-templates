#!/bin/bash

cd /opt
wget -O cf-cli.rpm "https://cli.run.pivotal.io/stable?release=redhat64"
yum -y install cf-cli.rpm
rm -f cf-cli.rpm

gem install bosh_cli
