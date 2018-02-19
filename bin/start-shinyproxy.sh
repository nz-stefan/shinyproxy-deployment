#!/bin/bash

# workaround to get shinyproxy running on MacOS
if [ "$(uname -s)" == "Darwin" ]; then
  echo "Using workaround on MacOS..."
  
  socat \
    TCP-LISTEN:2375,range=127.0.0.1/32,reuseaddr,fork \
    UNIX-CLIENT:/var/run/docker.sock &
  
  # kill any running shiny container
  dockerid=`docker ps | grep "shinyproxy/helloworld" | cut -f 1 -d\  `
  docker kill $dockerid
fi

# start shinyproxy
java -jar shinyproxy-1.0.2.jar
