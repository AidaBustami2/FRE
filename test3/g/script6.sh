#!/bin/bash
if ((($(docker images |grep img1 |wc -l) > 0 )) && (($(docker ps -a  |grep img1 |wc -l) > 0)))
then
 docker stop $(docker ps -a | grep img1 | awk '{print $1}')
 docker rm $(docker ps -a | grep img1 | awk '{print $1}')
 docker rmi img1
 echo "not zero"
else
 echo "zero"
fi

docker build /root/test  -t img1
docker run -d --privileged  -ti --name con1 -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup  -v /root/test:/root/test -v /var/www/html:/var/www/html -v /etc/yum.repos.d/:/etc/yum.repos.d/   -p 5444:8899 img1 /usr/sbin/init  sleep 1000000
docker exec -it con1  /root/test/createRepo.sh
docker exec -it con1 yum -y  --disablerepo=* --enablerepo=test  install httpd
docker exec -it con1  yum -y --disablerepo=* --enablerepo=test  install initscripts
docker exec  -it con1  yum -y --disablerepo=* --enablerepo=test   install net-tools
docker exec -it con1 yum -y --disablerepo=* --enablerepo=test  install firewalld
docker exec -it con1 systemctl enable httpd
docker exec -it con1 systemctl start httpd
docker exec -it con1 vi /etc/httpd/conf/httpd.conf
docker exec -it con1 systemctl restart httpd
docker exec -it con1 systemctl enable firewalld
docker exec -it con1 systemctl start firewalld
docker exec -it con1 firewall-cmd --zone=public --add-port=8899/tcp --permanent
docker exec -it con1 firewall-cmd --reload
docker exec -it con1  yum -y --disablerepo=* --enablerepo=test  install initscripts
docker exec -it con1  /root/test/isRunning.sh
docker exec -it con1 /root/test/isInstalled.sh

