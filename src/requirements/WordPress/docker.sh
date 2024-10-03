#!/bin/bash

# echo test $(dirname $0)
docker build -t nginx $(dirname $0)
docker run -d -p 9000:9000 wordpress