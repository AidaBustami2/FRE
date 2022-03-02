#!/bin/bash
if ((($(docker images |grep img1 |wc -l) > 0 )) && (($(docker ps -a  |grep img1 |wc -l) > 0)))
then
 docker stop $(docker ps -a | grep img1 | awk '{print $1}')
 docker rm $(docker ps -a | grep img1 | awk '{print $1}')
 docker rmi img1
fi

docker build /root/test2 --rm   -t img1
docker run -d --privileged=true  -ti --name AIDA -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run   -v /var/www/html:/var/www/html    -p 7070:8899 img1 


docker exec -it AIDA /root/test/isInstalled.sh
docker exec -it AIDA /root/test/isRunning.sh


