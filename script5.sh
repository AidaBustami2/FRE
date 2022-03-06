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
