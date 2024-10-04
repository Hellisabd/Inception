#!/bin/bash

# echo test $(dirname $0)
docker build -t wordpress $(dirname $0)
# docker run -d -p 9000:9000 wordpress
docker run -d --name wordpress --network wordpress-network -p 9000:9000 wordpress
