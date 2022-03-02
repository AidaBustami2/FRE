docker stop $(docker ps -a | grep img1 | awk '{print $1}')
docker rm  $(docker ps -a | grep img1 | awk '{print $1}')
docker rmi img1

