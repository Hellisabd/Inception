#!/bin/bash

# echo test $(dirname $0)
docker build -t mariadb $(dirname $0)
docker run -d --name mariadb -p 3306:3306 mariadb