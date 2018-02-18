#!/bin/bash

# identify OS
case "$(uname -s)" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# workaround to get shinyproxy running on MacOS
if [ "$machine" == "Mac" ]; then
  /usr/local/homebrew/Cellar/socat/1.7.3.2_2/bin/socat \
    TCP-LISTEN:2375,range=127.0.0.1/32,reuseaddr,fork \
    UNIX-CLIENT:/var/run/docker.sock &
fi

# start shinyproxy
java -jar shinyproxy-1.0.2.jar
