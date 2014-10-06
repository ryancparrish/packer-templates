#!/bin/bash

cd /opt

wget --no-cookies --no-check-certificate "https://services.gradle.org/distributions/gradle-2.1-bin.zip"

unzip gradle-2.1-bin.zip

rm -f gradle-2.1-bin.zip

alternatives --install /usr/bin/gradle gradle /opt/gradle-2.1/bin/gradle 2

echo "export GRADLE_HOME=/opt/gradle-2.1" >> /etc/profile.d/java.sh

