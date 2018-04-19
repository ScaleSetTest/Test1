#!/bin/bash

# install docker-compose on first boot
if [ ! -x "/opt/bin/docker-compose" ]
then
  curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` > docker-compose
  mkdir /opt
  mkdir /opt/bin
  mv docker-compose /opt/bin/docker-compose
  chmod +x /opt/bin/docker-compose
fi

# enviorment
export APP_VERSION=$2

# deploy application
APPNAME="MyApp"
if [ ! -d "/home/$APPNAME" ]
then
  mkdir /home/$APPNAME
fi
curl -H 'Cache-Control: no-cache' -L https://raw.githubusercontent.com/ScaleSetTest/Test1/master/docker-compose.yml > docker-compose.yml
cp docker-compose.yml /home/$APPNAME
cd /home/$APPNAME
docker login -u ContainersRegTest -p $1 containersregtest.azurecr.io
/opt/bin/docker-compose up -d
