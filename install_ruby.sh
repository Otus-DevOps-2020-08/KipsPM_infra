#!/bin/bash
echo "update repositories"
apt update
echo "install ruby and bundler"
apt install -y ruby-full ruby-bundler build-essential
