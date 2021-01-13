#!/bin/bash

docker build -t leandromb .
docker stop leandromb
docker run -d --rm -p 8001:8000 \
       --env-file  $HOME/leandromoraes.env \
       --name leandromb \
       -v $(pwd)/dkdata:/dkdata \
       leandromb start.sh