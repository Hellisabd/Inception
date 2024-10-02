#!/bin/bash

docker build -t nginx . && docker run -it -d nginx
apt update
apt upgrade
apt install nginx