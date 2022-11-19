#!/bin/bash

set -e

docker build -t apache-flask --file apache-flask.Dockerfile .
docker build -t apache --file apache.Dockerfile .
docker build -t apache-proxy --file apache-proxy.Dockerfile .
