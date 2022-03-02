#!/bin/bash
if (($(service httpd status | grep -v grep | grep '/usr/lib/systemd/system/httpd.service' | wc -w) > 0 ))
then
 echo "installed"
else
 echo "not installed"
fi


