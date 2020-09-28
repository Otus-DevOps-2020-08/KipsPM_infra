#!/bin/bash
sleep 20
set -e
APP_DIR=$HOME
DATABASE_URL=${1:-"127.0.0.1:21017"}
sudo apt update
sleep 20
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo sed "s/{{db_url}}/$DATABASE_URL/g" /tmp/puma.service > /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
