#!/bin/bash

set -e

docker network create webserv-net
docker run -d --rm --name flask --net webserv-net -v "$(pwd)/wsgi-flask-app":"/var/flask-app" apache-flask
docker run -d --rm --name apache --net webserv-net -v "$(pwd)/htdocs":"/var/www/localhost/htdocs" apache
docker run -d --rm --name proxy --net webserv-net -v "$(pwd)/proxy-flask.conf":"/etc/apache2/conf.d/proxy-flask.conf" -v "$(pwd)/proxy-apache.conf":"/etc/apache2/conf.d/proxy-apache.conf" -p9000:80 apache-proxy
