#!/bin/bash
#
#	cleanup.sh -
#	cleans up the temporary/unused files prior to packaging the vbox for distribution (helps shrinks vbox archive size).
#

#
# Clean out the local package repo caches
#
sudo rm -rf /etc/yum.repos.d/epel.repo
sudo yum clean all
gem sources --clear-all
sudo rm -rf /tmp/*

#
# Cleanup log files
#
find /var/log -type f | while read f; do echo -ne '' > $f; done;

#
# Remove the humongous, memory-mapped locale-archive, leaving only en_US
#
init 3	# stop the x server, whose processes may be using the local archive
localedef --list-archive | grep -v -e "en_US" | xargs localedef --delete-from-archive
mv --force /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
build-locale-archive
