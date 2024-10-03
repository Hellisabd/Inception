#!/bin/bash

# echo test $(dirname $0)
docker build -t mariadb $(dirname $0)
docker run -d -p 3306:3306 mariadb