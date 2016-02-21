#!/bin/bash

git clone -b 'v1.9.1' --depth 1 --single-branch https://github.com/docker/docker.git
cp -f ./Dockerfile.armv5 ./docker/Dockerfile

cd docker
#curl -L https://github.com/umiddelb/armhf/raw/master/Dockerfile.armv7 > Dockerfile
sudo make build
sudo make binary
#sudo service docker.io stop
#sudo cp bundles/1.9.1/binary/docker-1.9.1 /usr/bin
#(cd /usr/bin; sudo mv docker _docker; sudo ln -sf docker-1.9.1 docker) 
#sudo service docker.io start