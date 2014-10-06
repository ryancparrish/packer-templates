#!/bin/bash

cd /opt

wget --no-cookies --no-check-certificate "http://mirror.sdunix.com/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz"

tar xzf apache-maven-3.2.3-bin.tar.gz

rm -f apache-maven-3.2.3-bin.tar.gz

alternatives --install /usr/bin/mvn maven /opt/apache-maven-3.2.3/bin/mvn 2

echo "export M2_HOME=/opt/apache-maven-3.2.3" >> /etc/profile.d/java.sh
echo "export M2=$M2_HOME/bin" >> /etc/profile.d/java.sh

