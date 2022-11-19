#!/bin/bash

set -e

echo "### GET / from flask app (app1) ###"
curl -v --header 'Host: app1.example.local' http://127.0.0.1:9000
echo "##################"

echo "### GET /a/b/c from flask app (app1) ###"
curl -v --header 'Host: app1.example.local' http://127.0.0.1:9000/a/b/c
echo "##################"


echo "### GET / from apache (app2) ###"
curl -v --header 'Host: app2.example.local' http://127.0.0.1:9000
echo "##################"

echo "### GET /a/b/c ###"
curl -L -v --header 'Host: app2.example.local' http://127.0.0.1:9000/a/b/c/
echo "##################"
