#!/bin/bash

touch /etc/yum.repos.d/test.repo
var="[test]
name=test
baseurl=http://172.20.48.154:8899
enabled=1
gpgcheck=0";
destdir=/etc/yum.repos.d/test.repo

if [ -f "$destdir" ]
then 
    echo "$var" > "$destdir"
fi


