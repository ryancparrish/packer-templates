#!/bin/bash

cd /opt

wget -O jdk.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz"

tar xzf jdk.tar.gz

rm -f jdk.tar.gz

alternatives --install /usr/bin/java java /opt/jdk1.7.0_67/bin/java 2

echo export JAVA_HOME=/opt/jdk1.7.0_67 >> /etc/profile.d/java.sh
