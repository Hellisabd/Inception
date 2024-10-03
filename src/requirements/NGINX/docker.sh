#!/bin/bash

# echo test $(dirname $0)
docker build -t nginx $(dirname $0)
docker run -d -p 8443:8443 nginx