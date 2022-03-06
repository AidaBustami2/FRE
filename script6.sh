#!/bin/bash


docker run -d --privileged=true   --name AIDA2 -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run   -v /var/www/html:/var/www/html    -p 7997:8899 img1


docker exec  AIDA2 /root/test/isInstalled.sh
docker exec  AIDA2 /root/test/isRunning.sh


