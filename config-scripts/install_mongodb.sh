#!/bin/bash
echo "add key"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
echo "add repo"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo install https support
apt-get install apt-transport-https ca-certificates
echo "update apt"
sudo apt-get update
echo "install mongodb package"
sudo apt-get install -y mongodb-org
echo "start mongodb"
sudo systemctl start mongod
echo "enable autoexec"
sudo systemctl enable mongod
