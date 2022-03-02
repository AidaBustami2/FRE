if (($(service httpd status | grep -v grep | grep '(dead)' | wc -w) > 0 ))
then
 echo "not runing"

elif (($(service httpd status | grep -v grep | grep '(running)' | wc -w) > 0 ))
then 
 echo "runing"

else
 echo "not installed"
fi




