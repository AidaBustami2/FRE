#!/bin/bash
firewall-cmd --zone=public --add-port=8899/tcp --permanent 
firewall-cmd --reload
