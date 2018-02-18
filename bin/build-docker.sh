#!/bin/bash

# make sure the packrat definitions are up-to-date
R -e "packrat::snapshot()"

# build the docker container
docker build -t shinyproxy/helloworld .
