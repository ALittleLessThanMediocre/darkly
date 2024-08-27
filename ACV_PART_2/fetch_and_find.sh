#!/usr/bin/bash

IP=192.168.1.221
wget --mirror -A README -q -P ./darkly_site -e robots=off $IP/.hidden/
find ./darkly_site -name README | xargs grep [0-9] | cut -d : -f2
rm -fr ./darkly_site
