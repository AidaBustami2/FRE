FROM centos:7
USER root
ENV container docker
RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
COPY .  /root/test
ADD isRunning.sh  /root/test/
ADD isInstalled.sh /root/test/
ADD createRepo.sh  /root/test/
RUN chmod 777  /root/test/createRepo.sh
RUN chmod 777  /root/test/isRunning.sh
RUN  chmod 777  /root/test/isInstalled.sh
WORKDIR /root/test

RUN ./createRepo.sh


RUN yum -y  --disablerepo=* --enablerepo=test  install httpd
RUN yum -y --disablerepo=* --enablerepo=test  install initscripts
RUN yum -y --disablerepo=* --enablerepo=test   install net-tools
RUN  sed -i   '42s/Listen 80/Listen 8899/' /etc/httpd/conf/httpd.conf
RUN systemctl enable httpd
RUN /usr/sbin/httpd


VOLUME [ "/sys/fs/cgroup" ]
CMD  [ "/usr/sbin/init"]














