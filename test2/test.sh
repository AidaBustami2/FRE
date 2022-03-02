systemctl enable firewalld
systemctl start firewalld
firewall-cmd --zone=public --add-port=8899/tcp --permanent
firewall-cmd --reload

