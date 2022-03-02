#!/bin/bash
docker build /root/test  -t img1
docker run -d --privileged --name pain -ti -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup  -v /root/test:/root/test -v /var/www/html:/var/www/html -v /etc/yum.repos.d/:/etc/yum.repos.d/   -p 5444:8899 img1 /usr/sbin/init  sleep 1000000
docker exec -it yum -y  --disablerepo=* --enablerepo=test install httpd
docker exec -it pain vi /etc/httpd/conf/httpd.conf
docker exec  -it pain  yum -y install net-tools
docker exec -it pain  yum -y install firewalld
docker exec -it  pain systemctl enable httpd
docker exec -it  pain systemctl start httpd
docker exec -it pain  /root/test/script.sh
docker exec -it pain /root/test/script2.sh

