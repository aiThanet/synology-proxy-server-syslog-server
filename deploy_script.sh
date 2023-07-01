#!/bin/sh

IMAGE_NAME="synology-proxy-server-syslog-server"
MY_USER="thanet31756"

echo "STOP CONTAINNER"
docker rm $(docker stop $(docker ps -a -q --filter="name=synology-proxy-server-syslog-server"))

echo "DELETE IMAGE"
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep "$IMAGE_NAME")

docker rm $(docker stop $(docker ps -a -q --filter ancestor=<image-name> --format="{{.ID}}"))


docker run -d  --restart=always -e SYSLOG_USERNAME=admin -e SYSLOG_PASSWORD=1234 -p 8123:80 -p 519:514/udp -v /volume1/docker/rsyslog:/var/log/net/ --name "synology-proxy-server-syslog-server" "thanet31756/synology-proxy-server-syslog-server:latest"