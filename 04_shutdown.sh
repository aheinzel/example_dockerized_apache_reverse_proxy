#!/bin/bash

set -e

docker stop proxy
docker stop flask
docker stop apache
#docker network rm webserv-net
