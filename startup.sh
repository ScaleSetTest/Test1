#!/bin/bash

# Env vars
REG_PWD=$1
APP_VERSION=$2
REG_LOC="containersregtest.azurecr.io"
REG_USR="ContainersRegTest"

# docker-compose vars
export APP_VERSION
export REG_LOC
export DB_URL="//somedatabase"
export DB_USR="dbuser"
export DB_PWD="secret"

# install docker-compose on first boot
if [ ! -x "/opt/bin/docker-compose" ]
then
  curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` > docker-compose
  mkdir /opt
  mkdir /opt/bin
  mv docker-compose /opt/bin/docker-compose
  chmod +x /opt/bin/docker-compose
fi

# create app space
APPHOME="/home/MyApp"
if [ ! -d "$APPHOME" ]
then
  mkdir $APPHOME
fi


# deploy
curl -H 'Cache-Control: no-cache' -L https://raw.githubusercontent.com/ScaleSetTest/Test1/master/docker-compose.yml > docker-compose.yml
cp docker-compose.yml $APPHOME
cd $APPHOME
docker login -u $REG_USR -p $REG_PWD $REG_LOC
/opt/bin/docker-compose up -d
