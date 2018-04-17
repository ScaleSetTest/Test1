
curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` > docker-compose
mkdir /opt/
mkdir /opt/bin
mv docker-compose /opt/bin/docker-compose
chmod +x /opt/bin/docker-compose

curl -L https://raw.githubusercontent.com/ScaleSetTest/Test1/master/docker-compose.yml > docker-compose.yml
mkdir
/opt/bin/docker-compose up -d


#docker run --rm --name docker-nginx -p 81:80 -d nginx
#docker run --rm --name docker-apache -p 80:80 -d httpd
