#!/bin/bash

if (($(docker ps -a  |grep AIDA2 |wc -l) > 0 ))
then
 docker stop $(docker ps -a | grep AIDA2 | awk '{print $1}')
 docker rm $(docker ps -a | grep AIDA2 | awk '{print $1}')
fi
if ((($(docker images |grep img1 |wc -l) > 0 )) && (($(docker ps -a  |grep img1 |wc -l) > 0)) && (($(docker ps -a  |grep AIDA2 |wc -l) > 0)))
then
 docker stop $(docker ps -a | grep img1 | awk '{print $1}')
 docker rm $(docker ps -a | grep img1 | awk '{print $1}')
 docker rm $(docker ps -a | grep AIDA2 | awk '{print $1}')
 docker rmi img1
fi

docker build /root/test2 --rm   -t img1
docker run -d --privileged=true   --name AIDA2 -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run   -v /var/www/html:/var/www/html    -p 7997:8899 img1


docker exec  AIDA2 /root/test/isInstalled.sh
docker exec  AIDA2 /root/test/isRunning.sh


